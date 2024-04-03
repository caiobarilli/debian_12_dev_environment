#!/bin/bash

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

# Função para exibir o título
show_title() {
    # clear
    figlet -f smslant "Developer Environment"
    figlet -f term "==================="
    figlet -f term " DISTRO: DEBIAN 12"
    figlet -f term " VERSION: v1.0.0"
    figlet -f term "==================="
    echo ""
}

# Menu
while true; do
    show_title
    echo "Choose an option:"
    echo ""
    echo "1. Full installation"
    echo "2. Uninstall"
    echo "3. Exit"
    echo "\n"
    read -p "Enter your choice: " option

    case $option in
        1)
            install
            exit 0
            ;;
        2)
            uninstall
            exit 0
            ;;
        3)
            exit 0
            log "Exiting the script."
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

log "Showing main menu..."
