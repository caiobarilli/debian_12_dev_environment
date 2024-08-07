#!/bin/bash

# Log
. ./src/scripts/utils/logs.sh

# User
. ./src/scripts/utils/user.sh

# Ler as variáveis do arquivo
vars_file="./storage/vars/user_vars"
source "$vars_file"

# Criação da chave SSH
echo "Creating SSH key..."
log "Creating SSH key..."

if [ -z "$(ls -A "$ssh_key_path")" ]; then
    log "SSH folder is empty."
else
    echo "Deleting existing SSH key..."
    log "Deleting existing SSH key..."
    rm -rf "$user_home/.ssh"* > /dev/null 2>&1
    mkdir -p "$ssh_dir"
fi

if [ "$existing_ssh" = "no" ]; then
    if [ "$passphrase" = "" ]; then
        ssh-keygen -t ed25519 -C "$email" -f "$ssh_key_path" -N "" > /dev/null 2>&1
        echo "SSH key created."
        log "SSH key created."

        eval "$(ssh-agent -s)"
        ssh-add "$ssh_key_path" < /dev/null
        echo "SSH key added to ssh-agent."
        log "SSH key added to ssh-agent."

    else
        log "Creating SSH key with passphrase..."
        ssh-keygen -t ed25519 -C "$email" -f "$ssh_key_path" -N "$passphrase" > /dev/null 2>&1
        echo "SSH key created with passphrase."
        log "SSH key created with passphrase."

        eval "$(ssh-agent -s)"
        echo "$passphrase" | ssh-add "$ssh_key_path" < /dev/null
        echo "SSH key added to ssh-agent."

    fi
else
    cp -r "./storage/keys/$ssh_key_folder/"* "$ssh_dir"
    echo "Existing SSH key copied."
    log "Existing SSH key copied."

    ssh_keys=$(ls "$user_home/.ssh")
    for key in $ssh_keys; do
        if [[ $key == *.pub ]]; then
            if [ "$key" == "id_rsa.pub" ]; then
                mv "$user_home/.ssh/$key" "$user_home/.ssh/key.pub"
                mv "$user_home/.ssh/key.pub" "$user_home/.ssh/id_rsa.pub"
            else
                mv "$user_home/.ssh/$key" "$user_home/.ssh/id_rsa.pub"
            fi
        else
            if [ "$key" == "id_rsa" ]; then
                mv "$user_home/.ssh/$key" "$user_home/.ssh/key"
                mv "$user_home/.ssh/key" "$user_home/.ssh/id_rsa"
            else
                mv "$user_home/.ssh/$key" "$user_home/.ssh/id_rsa"
            fi
        fi
    done

    echo "Existing SSH key renamed to id_rsa."
    log "Existing SSH key renamed to id_rsa."

    chmod 600 $user_home/.ssh/
    chown -R $user_name $ssh_dir > /dev/null 2>&1
    chgrp -R $user_name $ssh_dir > /dev/null 2>&1

    eval "$(ssh-agent -s)"
    ssh-add "$ssh_key_path" < /dev/null
    echo "SSH key added to ssh-agent."
    log "SSH key added to ssh-agent."
fi

# Instalação do servidor SSH
echo "Installing OpenSSH Server..."
log "Installing OpenSSH Server..."
sudo apt-get install -y openssh-server

# Verificar se o servidor SSH está rodando
if [ "$(service ssh status | grep -o "Active: active")" = "Active: active" ]; then
    echo "OpenSSH Server is running."
    log "OpenSSH Server is running."
else
    echo "OpenSSH Server is not running."
    log "OpenSSH Server is not running."
    echo "Starting OpenSSH Server..."
    log "Starting OpenSSH Server..."
    sudo service ssh start
fi

# Verificar se o arquivo authorized_keys existe
authorized_keys="$user_home/.ssh/authorized_keys"
if [ ! -f "$authorized_keys" ]; then
    touch "$authorized_keys"
fi

# Adicionar chave à authorized_keys
echo "Adding SSH key to authorized_keys..."
log "Adding SSH key to authorized_keys..."
cat "$user_home/.ssh/id_rsa.pub" >> "$authorized_keys"
chmod 600 ~/.ssh/authorized_keys
