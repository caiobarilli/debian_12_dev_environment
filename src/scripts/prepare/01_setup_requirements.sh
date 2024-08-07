#!/bin/bash

clear

# Log

. ./src/scripts/utils/logs.sh

# Update package list and upgrade installed packages
echo "Updating package list..."
log "Updating package list..."
apt update > /dev/null 2>&1
echo "Upgrading installed packages..."
log "Upgrading installed packages..."
apt upgrade -y > /dev/null 2>&1

# Initial setup
echo "Installing required packages..."
log "Installing required packages..."

# Install figlet
if ! command -v figlet &> /dev/null; then
    apt install figlet -y > /dev/null 2>&1
    log "Installing figlet..."
fi

wait

# Finish

echo "Installation of required packages completed successfully."

echo "Starting the script..."

echo "\n"
