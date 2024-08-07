#!/bin/bash

# Função para exibir o título
show_title() {
    figlet -f smslant "Developer Environment"
    figlet -f term "==================="
    figlet -f term " DISTRO: DEBIAN 12"
    figlet -f term " VERSION: v1.0.0"
    figlet -f term "==================="
    echo ""
    echo "Choose an option:"
    echo ""
    echo "1. Manual installation"
    echo "2. Auto installation"
    echo "3. Uninstall"
    echo "4. Exit"
    echo "\n"
    read -p "Enter your choice: " option
    echo ""
}

# Menu
while true; do
    show_title
    case $option in
        1)
            . ./src/scripts/menus/manual_installation.sh
            exit 0
            ;;
        2)
            install
            exit 0
            ;;
        3)
            uninstall
            exit 0
            ;;
        4)
            echo "Bye."
            echo ""
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

log "Showing main menu..."
