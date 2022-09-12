#!/bin/bash

# WIP

PKG_MNGR=""
PKG_MNGR_INSTALL=""
PKG_MNGR_UPDATE_SYSTEM=""

detect_pkg_manager() {
    if [ -x "$(command -v apt)" ]; then
        PKG_MNGR="apt"
        PKG_MNGR_INSTALL="apt install -y"
        PKG_MNGR_UPDATE_SYSTEM="apt update && apt upgrade -y"

    elif [ -x "$(command -v pacman )" ]; then
        PKG_MNGR="pacman"
        PKG_MNGR_INSTALL="pacman -S --noconfirm"
        PKG_MNGR_UPDATE_SYSTEM="pacman -Syu --noconfirm"

    elif [ -x "$(command -v dnf )" ]; then
        PKG_MNGR="dnf"
        PKG_MNGR_INSTALL="dnf install -y"
        PKG_MNGR_UPDATE_SYSTEM="dnf upgrade -y"

    elif [ -x "$(command -v zypper )" ]; then
        PKG_MNGR="zypper"
        PKG_MNGR_INSTALL="zypper -n install"
        PKG_MNGR_UPDATE_SYSTEM="zypper -n dup"

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
    zathura tmux fusuma \
    htop ncdu ripgrep fd \
    gcc gcc-c++ make cmake"

sudo ${PKG_MNGR_INSTALL} ${packages}

echo "Making scripts executable (might prompt you for your root password)..."

sudo chmod +x scripts/install-scripts/link-scripts.sh
sudo chmod +x scripts/install-scripts/link-dotfiles.sh
sudo chmod +x scripts/install-scripts/clean.sh

echo "Preparing to create symlinks..."

./scripts/install-scripts/clean.sh

echo "Creating symlinks..."

./scripts/install-scripts/link-scripts.sh
./scripts/install-scripts/link-dotfiles.sh

echo "Installing rust..."

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
