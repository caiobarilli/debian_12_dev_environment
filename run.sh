#!/bin/bash

# Verifica se o script está sendo executado como sudo
if [ "$(id -u)" != "0" ]; then
    echo "Please run this script as sudo or root."
    exit 1
fi

# Setup requirements
if [ -f ./src/scripts/prepare/01_setup_requirements.sh ]; then
    . ./src/scripts/prepare/01_setup_requirements.sh
else
    echo "Error: setup script not found or inaccessible."
    log "Error: setup script not found or inaccessible."
    exit 1
fi

# Main
if [ -f ./src/main.sh ]; then
    log "Starting the script..."
    . ./src/main.sh
else
    echo "Error: main script not found or inaccessible."
    log "Error: main script not found or inaccessible."
    exit 1
fi
