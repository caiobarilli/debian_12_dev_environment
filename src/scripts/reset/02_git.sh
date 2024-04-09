#!/bin/bash

echo "Uninstalling packages installed by setup script..."

# Remove o figlet
apt remove --purge figlet -y > /dev/null 2>&1

echo "Uninstalling figlet..."

wait

# Remove o Git
apt remove --purge git -y > /dev/null 2>&1

echo "Uninstalling git..."
