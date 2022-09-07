#!/bin/bash

# WIP

PKG_MNGR=""
PKG_MNGR_INSTALL=""

detect_pkg_manager() {
    if [ -x "$(command -v apt)" ]; then
        PKG_MNGR="apt"
        PKG_MNGR_INSTALL="apt install -y"

    elif [ -x "$(command -v pacman )" ]; then
        PKG_MNGR="pacman"
        PKG_MNGR_INSTALL="pacman -S --noconfirm"

    elif [ -x "$(command -v dnf )" ]; then
        PKG_MNGR="dnf"
        PKG_MNGR_INSTALL="dnf install -y"

    elif [ -x "$(command -v zypper )" ]; then
        PKG_MNGR="zypper"
        PKG_MNGR_INSTALL="zypper -n install"

    else
        echo -e "No package manager could be detected on the system\nExiting script..."
        exit 1
    fi

}

detect_pkg_manager

echo "Using ${PKG_MNGR} to install packages..."

echo "This script needs root privileges to install packages..."

packages="zsh rofi nvim \
    alacritty ncmpcpp mpd \
    zathura tmux"

# TODO install programs

echo "Making scripts executable (might prompt you for your root password)..."

sudo chmod +x scripts/install-scripts/link-scripts.sh
sudo chmod +x scripts/install-scripts/link-dotfiles.sh

echo "Creating symlinks..."

./scripts/install-scripts/link-scripts.sh
./scripts/install-scripts/link-dotfiles.sh
