#!/bin/bash

clear

# Função para instalar
install() {
    echo "Starting installation..."

    # Scripts
    for script in ./src/scripts/steps/*.sh; do
        bash "$script"
        if [ $? -ne 0 ]; then
            echo "Error encountered. Aborting installation."
            exit 1
        fi
    done
    echo "Installation completed successfully."
}

# Função para remover
uninstall() {
    echo "Starting uninstallation..."
    for script in ./src/scripts/reset/*.sh; do
        bash "$script"
        if [ $? -ne 0 ]; then
            echo "Error encountered. Aborting uninstallation."
            exit 1
        fi
    done
    echo "Uninstallation completed successfully."
}

# Importando o menu principal
. ./src/scripts/menus/main_menu.sh
