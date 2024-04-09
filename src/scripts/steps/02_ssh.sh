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
            mv "$user_home/.ssh/$key" "$user_home/.ssh/key.pub"
            wait
            mv "$user_home/.ssh/key.pub" "$user_home/.ssh/id_rsa.pub"
        else
            mv "$user_home/.ssh/$key" "$user_home/.ssh/key"
            wait
            mv "$user_home/.ssh/key" "$user_home/.ssh/id_rsa"
        fi
    done
    echo "Existing SSH key renamed."
    log "Existing SSH key renamed."

    chmod 600 $user_home/.ssh/
    chown -R $user_name $ssh_dir > /dev/null 2>&1
    chgrp -R $user_name $ssh_dir > /dev/null 2>&1

    eval "$(ssh-agent -s)"
    ssh-add "$ssh_key_path" < /dev/null
    echo "SSH key added to ssh-agent."
    log "SSH key added to ssh-agent."
fi

