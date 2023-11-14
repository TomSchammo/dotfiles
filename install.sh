#!/bin/bash

# WIP

flatpak_packages="md.obsidian.Obsidian com.spotify.Client com.discordapp.Discord"

PKG_MNGR=""
PKG_MNGR_INSTALL=""
PKG_MNGR_UPDATE_SYSTEM=""

PACKAGE_LIBINPUT="libinput-devel"

detect_pkg_manager() {
    if [ -x "$(command -v apt)" ]; then
        PKG_MNGR="apt"
        PKG_MNGR_INSTALL="apt install -y"
        PKG_MNGR_UPDATE_SYSTEM="apt update && apt upgrade -y"
        PACKAGE_LIBINPUT="libinput-tools"

    elif [ -x "$(command -v pacman)" ]; then
        PKG_MNGR="pacman"
        PKG_MNGR_INSTALL="pacman -S --noconfirm"
        PKG_MNGR_UPDATE_SYSTEM="pacman -Syu --noconfirm"
        PACKAGE_LIBINPUT="libinput"

    elif [ -x "$(command -v dnf)" ]; then
        PKG_MNGR="dnf"
        PKG_MNGR_INSTALL="dnf install -y"
        PKG_MNGR_UPDATE_SYSTEM="dnf upgrade -y"
        PACKAGE_LIBINPUT="libinput"

    elif [ -x "$(command -v zypper)" ]; then
        PKG_MNGR="zypper"
        PKG_MNGR_INSTALL="zypper -n install"
        PKG_MNGR_UPDATE_SYSTEM="zypper -n dup"
        PACKAGE_LIBINPUT="libinput-tools"

    else
        echo -e "No package manager could be detected on the system\nExiting script..."
        exit 1
    fi

}

echo "Setting up system..."

if [[ -z "${XDG_CONFIG_HOME}" ]]; then
    echo "XDG_CONFIG_HOME is not set, setting it to ${HOME}/.config"
    export XDG_CONFIG_HOME="${HOME}/.config"
else
    echo "XDG_CONFIG_HOME is set to ${XDG_CONFIG_HOME}"
fi

detect_pkg_manager

echo "Using ${PKG_MNGR} to install packages..."

echo "This script needs root privileges to install packages..."

packages="zsh rofi neovim \
    alacritty ncmpcpp mpd \
    zathura tmux htop \
    ncdu ripgrep fd jq \
    gcc gcc-c++ make cmake \
    ruby xdotool ${PACKAGE_LIBINPUT} \
    fzf restic tldr"

sudo "${PKG_MNGR_INSTALL}" "${packages}"

echo "updating tldr cache..."

tldr -u

echo "installing fusuma using gem..."

sudo gem install fusuma

echo "Making scripts executable (might prompt you for your root password)..."

sudo chmod +x scripts/install-scripts/link-scripts.sh
sudo chmod +x scripts/install-scripts/link-dotfiles.sh
sudo chmod +x scripts/install-scripts/clean.sh

echo "Preparing to create symlinks..."

./scripts/install-scripts/clean.sh

echo "Creating symlinks..."

./scripts/install-scripts/link-scripts.sh
./scripts/install-scripts/link-dotfiles.sh

echo "Setting up user '${USER}'..."

echo "Setting default shell to zsh"

sudo usermod ${USER} -s /bin/zsh

echo "Generating completion script for restic"

sudo restic generate --zsh-completion /usr/local/share/zsh/site-functions/_restic
sudo restic generate --bash-completion /etc/bash_completion.d/restic

echo "setting up permissions for fusuma..."

sudo gpasswd -a ${USER} input
newgrp input

echo "Installing rust..."

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# TODO: make sure flatpak is installed?

echo "setting up flathub..."

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Installing flatpak packages..."

flatpak install -y "${flatpak_packages}"
