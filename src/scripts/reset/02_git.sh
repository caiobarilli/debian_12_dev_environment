#!/bin/bash

# Remove o diretório .ssh
if [ "$EUID" -eq 0 ]; then
    user_name="$SUDO_USER"
else
    user_name="$USER"
fi

user_home="/home/$user_name"
ssh_dir="$user_home/.ssh"

rm -rf "$ssh_dir"

echo "Deleting .ssh directory..."

wait

# Remove o Git
apt remove --purge git -y > /dev/null 2>&1

echo "Uninstalling git..."
