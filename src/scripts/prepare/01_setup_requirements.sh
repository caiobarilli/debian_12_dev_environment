#!/bin/bash

# clear

# Log

. ./src/scripts/utils/logs.sh

# Setup requirements

echo "Installing required packages..."

apt update > /dev/null 2>&1

log "Updating package list..."

apt upgrade -y > /dev/null 2>&1

log "Upgrading installed packages..."

# Install figlet

apt install figlet -y > /dev/null 2>&1

log "Installing figlet..."

wait

# Finish

echo "Installation of required packages completed successfully."

echo "Starting the script..."

echo "\n"
