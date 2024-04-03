#!/bin/bash

# Storage folders
storage_folder="./storage/"
keys_folder="./storage/keys/"
vars_folder="./storage/vars/"

if [ ! -f "$storage_folder" ]; then
    mkdir -p "$storage_folder"
    mkdir -p "$keys_folder"
    chmod 777 "$keys_folder"
    mkdir -p "$vars_folder"
fi

# User vars
user_var_file="./storage/vars/user_vars"
if [ ! -f "$user_var_file" ]; then
    sh ./generate.sh
fi
