#!/bin/bash

clear

# Função para exibir o título
show_title() {
    # clear
    figlet -f term "==================="
    figlet -f term " DISTRO: DEBIAN 12"
    figlet -f term " VERSION: v1.0.0"
    figlet -f term "===================".
    echo ""
    figlet -f term "MANUAL INSTALLATION"
    echo ""
    echo "Choose an option:"
    echo ""
    echo "1. Install SSH Keys"
    echo "2. Install SSH Server"
    echo "3. Install Git"
    echo "10. Back to main menu"
    echo "\n"
    read -p "Enter your choice: " option
}

# Menu
while true; do
    show_title

    case $option in
        1)
            exit 0
            ;;
        2)
            exit 0
            ;;
        10)
            . ./src/main.sh
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

log "Showing manual installation menu..."
