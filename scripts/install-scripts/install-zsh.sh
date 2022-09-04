#!/bin/bash

# NOTE: this script is outdated! It also only supports pacman and apt for package mangers.
#       This script should not be used!

PKG_MNGR=""
PKG_MNGR_INSTALL=""

detect_pkg_manager() {
    if [ -x "$(command -v apt)" ]; then
        PKG_MNGR="apt"
        PKG_MNGR_INSTALL="apt install -y"

    elif [ -x "$(command -v pacman )" ]; then
        PKG_MNGR="pacman"
        PKG_MNGR_INSTALL="pacman -S --noconfirm"

    else
        echo -e "No package manager could be detected on the system\nExiting script..."
        exit 1
    fi

}

detect_pkg_manager

echo "Using ${PKG_MNGR} as the system package manager..."

echo "This script needs root privileges to install packages..."

# installing zsh
sudo ${PKG_MNGR_INSTALL} zsh

# installing git to clone plugins
sudo ${PKG_MNGR_INSTALL} git

if [ -f dotfiles/zshrc ]; then
    mv dotfiles/zshrc ~/.zshrc
else
    wget https://raw.githubusercontent.com/TomSchammo/dotfiles/arch/dotfiles/zshrc
    mv zshrc ~/.zshrc
fi


CURRENT_IDR=${pwd}

mkdir -p ~/.config/zsh/plugins

cd ~/.config/zsh/plugins

git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions

cd ${CURRENT_IDR}

chsh -s /bin/zsh
