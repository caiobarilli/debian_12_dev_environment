#!/bin/bash

# clear

# Log
. ./src/scripts/utils/logs.sh

# User home
. ./src/scripts/utils/user.sh

# Ler as variáveis do arquivo
vars_file="./storage/vars/user_vars"
source "$vars_file"

# Instalação do Git
echo "Installing Git..."
apt install git -y > /dev/null 2>&1
log "Installing Git..."

# Configuração do Git
echo "Configuring Git..."
log "Configuring Git..."

git config --global user.name "$username"
git config --global user.email "$email"

log "GitHub Username: $username"
log "GitHub Email: $email"

# Configuração do arquivo ~/.ssh/config
cat << EOF > "$ssh_dir/config"
Host github.com
User $username
IdentityFile $ssh_key_path
EOF

echo "config file created at $ssh_dir/config"
log "config file created at $ssh_dir/config"

# Adicionar chave ao known_hosts
ssh-keyscan -t rsa github.com >> "$ssh_dir/known_hosts"
echo "SSH key added to known_hosts."
log "SSH key added to known_hosts."

# Definir permissões para o diretório .ssh
echo "Setting permissions for $ssh_key_path..."
chmod 600 "$ssh_key_path" > /dev/null 2>&1

echo "Setting permissions for $ssh_dir..."
chmod 700 "$ssh_dir" > /dev/null 2>&1

echo "Setting permissions for $ssh_dir/known_hosts..."
chmod 600 "$ssh_dir/known_hosts" > /dev/null 2>&1

echo "Changing owner to $user_name for $ssh_dir..."
chown -R $user_name $ssh_dir > /dev/null 2>&1

echo "Changing group to $user_name for $ssh_dir..."
chgrp -R $user_name $ssh_dir > /dev/null 2>&1

echo "Permissions set for $ssh_dir."
log "Permissions set for $ssh_dir."

# Testar a conexão com o GitHub
echo "Testing SSH connection to GitHub..."
ssh -o StrictHostKeyChecking=no -T git@github.com > /dev/null 2>&1

if [ $? -eq 1 ]; then
    echo "SSH connection to GitHub failed."
    log "SSH connection to GitHub failed."
else
    echo "SSH connection to GitHub successful."
    log "SSH connection to GitHub successful."
fi

echo ""
echo "Git installed and configured successfully."
echo ""

if [ "$existing_ssh" = "no" ]; then
    figlet -f term "==============================="
    figlet -f term "Copy the SSH public key below:"
    figlet -f term "==============================="
    echo ""
    echo $(cat "$ssh_key_path.pub")
    echo ""
    figlet -f term "Please add the following SSH public key to your GitHub account:"
    figlet -f term "You can add it to GitHub by visiting https://github.com/settings/keys"
    echo ""
fi

# Registro final no log
log "Git installed and configured successfully."
