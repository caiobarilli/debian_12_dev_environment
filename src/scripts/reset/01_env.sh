#!/bin/bash

echo "Uninstalling packages installed by setup script..."

# Remove o figlet
apt remove --purge figlet -y > /dev/null 2>&1

echo "Uninstalling figlet..."

wait

# Remove a pasta logs
rm -rf ./logs/

echo "Deleting log files..."

wait

# Remove a pasta storage
rm -rf ./storage

echo "Deleting variable files..."

wait
