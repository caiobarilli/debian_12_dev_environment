#!/bin/bash

echo "generating user variables..."
echo ""

echo "==================="
echo " GIT CONFIGURATION "
echo "==================="

echo ""

read -p "Enter github username: " username
read -p "Enter github email: " email

echo ""

echo "==================="
echo " SSH KEYS "
echo "==================="

echo ""

read -p "Do you have an existing SSH key? (yes/no): " existing_ssh

if [ "$existing_ssh" = "yes" ]; then
    while true; do
        read -p "Enter folder name of the existing SSH key: " ssh_key_folder
        if [ -d "./storage/keys/$ssh_key_folder"  ]; then
            echo "Existing SSH key folder found."
            log "Existing SSH key folder found."
            break  # Sai do loop enquanto uma pasta válida é encontrada
        else
            echo "Error: SSH key folder not found at ./storage/keys/$ssh_key_folder"
            log "Error: SSH key folder not found at ./storage/keys/$ssh_key_folder"
        fi
    done
else
    read -p "Wish use a passphrase for the SSH key? (yes/no): " use_passphrase
    if [ "$use_passphrase" = "yes" ]; then
        stty -echo # Desativar a exibição dos caracteres ao digitar a senha
        echo "Enter passphrase for new SSH key:"
        read -r passphrase
        stty echo # Reativar a exibição dos caracteres
    else
        passphrase=""
    fi
fi

user_var_file="./storage/vars/user_vars"
cat <<EOF > "$user_var_file"
username="$username"
email="$email"
existing_ssh="$existing_ssh"
ssh_key_folder="$ssh_key_folder"
passphrase="$passphrase"
EOF

echo "\n"
