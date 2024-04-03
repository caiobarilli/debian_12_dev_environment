#!/bin/bash

# Log
. ./src/scripts/utils/logs.sh

# Remove os arquivos de variáveis

rm -rf ./storage/vars/*

log "Deleting variable files..."

wait

# Remove o figlet

apt remove --purge figlet -y > /dev/null 2>&1

log "Uninstalling figlet..."

wait

echo "Ends script execution."
