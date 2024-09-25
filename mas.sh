#!/bin/bash

# Function to check if mas is installed
function check_mas_installed {
    if ! command -v mas &> /dev/null; then
        echo "mas is not installed. Installing it using Homebrew..."
        brew install mas
    else
        echo "mas is already installed."
    fi
}

# Prompt user to log in to the Mac App Store
function login_mas {
    echo "Please log in to the Mac App Store."
    mas account &> /dev/null

    if [ $? -ne 0 ]; then
        mas signin --dialog
        if [ $? -ne 0 ]; then
            echo "Login failed. Exiting..."
            exit 1
        fi
    else
        echo "Already logged in."
    fi
}

# Function to install apps via mas
function install_apps {
    echo "Installing apps..."

    # List of apps to install
    mas install 497799835  # Xcode
    mas install 441258766  # Magnet
    mas install 639968404  # Parcel
    mas install 1423210932 # Flow
    mas install 937984704  # Amphetamine

    echo "All apps have been installed."
}

# Main script
check_mas_installed
login_mas
install_apps
