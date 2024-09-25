#!/bin/bash

# Function to check if VS Code is installed
function check_vscode_installed {
    if ! command -v code &> /dev/null; then
        echo "Visual Studio Code is not installed or the 'code' command is not available. Please install it and enable the 'code' command in PATH."
        exit 1
    else
        echo "Visual Studio Code is already installed."
    fi
}

# Function to install VS Code extensions
function install_vscode_extensions {
    echo "Installing VS Code extensions..."

    code --install-extension bradlc.vscode-tailwindcss
    code --install-extension clinyong.vscode-css-modules
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension dracula-theme.theme-dracula
    code --install-extension editorconfig.editorconfig
    code --install-extension esbenp.prettier-vscode
    code --install-extension github.copilot
    code --install-extension github.copilot-chat
    code --install-extension gruntfuggly.todo-tree
    code --install-extension jock.svg
    code --install-extension ms-vscode.atom-keybindings
    code --install-extension statelyai.stately-vscode
    code --install-extension steoates.autoimport
    code --install-extension stylelint.vscode-stylelint
    code --install-extension unifiedjs.vscode-mdx
    code --install-extension vscode-icons-team.vscode-icons
    code --install-extension vue.volar
    code --install-extension vunguyentuan.vscode-css-variables
    code --install-extension waderyan.gitblame
    code --install-extension wayou.vscode-todo-highlight
    code --install-extension wix.vscode-import-cost
    code --install-extension yoavbls.pretty-ts-errors

    echo "All VS Code extensions have been installed."
}

# Main script
check_vscode_installed
install_vscode_extensions
