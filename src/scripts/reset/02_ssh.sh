#!/bin/bash

# User
. ./src/scripts/utils/user.sh

# Remove o diretório .ssh
if [ -d "$ssh_dir" ]; then
    rm -rf "$ssh_dir"
fi

echo "Deleting .ssh directory..."

wait

# Desabilita o serviço SSH
echo "Disabling SSH service..."
sudo systemctl disable ssh > /dev/null 2>&1

#remove o pacote openssh-server
echo "Removing openssh-server package..."
sudo apt-get remove -y openssh-server > /dev/null 2>&1
