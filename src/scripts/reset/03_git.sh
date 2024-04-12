#!/bin/bash

echo "Uninstalling packages installed by setup script..."

# Remove o Git
apt remove --purge git -y > /dev/null 2>&1

echo "Uninstalling git..."
