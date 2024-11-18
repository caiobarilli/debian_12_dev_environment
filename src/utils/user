#!/bin/bash

# Obter o nome do usuário que executou o comando sudo
if [ "$EUID" -eq 0 ]; then
    user_name="$SUDO_USER"
else
    user_name="$USER"
fi

# Diretório de armazenamento de chaves SSH
user_home="/home/$user_name"
ssh_dir="$user_home/.ssh"
[ ! -d "$ssh_dir" ] && mkdir -p "$ssh_dir"

# Caminho completo para a chave SSH
ssh_key_path="$ssh_dir/id_rsa"
