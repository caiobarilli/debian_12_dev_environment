#!/bin/bash

# Verifica se o script está sendo executado como sudo
if [ "$(id -u)" != "0" ]; then
    echo "Please run this script as sudo or root."
    exit 1
fi

# Setup requirements
if [ -f ./src/setup/init ]; then
    . ./src/setup/init
else
    echo "Error: setup script not found or inaccessible."
    log "Error: setup script not found or inaccessible."
    exit 1
fi

# Main
if [ -f ./src/main ]; then
    log "Starting the script..."
    . ./src/main
else
    echo "Error: main script not found or inaccessible."
    log "Error: main script not found or inaccessible."
    exit 1
fi
