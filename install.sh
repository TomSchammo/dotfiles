#!/bin/bash

# WIP

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
