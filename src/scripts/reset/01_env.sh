#!/bin/bash

# User
. ./src/scripts/utils/user.sh

# Remove o diretório .ssh
if [ -d "$ssh_dir" ]; then
    rm -rf "$ssh_dir"
fi

echo "Deleting .ssh directory..."

wait

# Remove a pasta logs
rm -rf ./logs/

echo "Deleting log files..."

wait

# Remove a pasta storage
rm -rf ./storage

echo "Deleting variable files..."

wait
