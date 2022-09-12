#!/bin/bash

# This scrip links the dotfiles from the repository into their respective place.
# Symbolic links are created instead of moving or copying the files since it
# seems kind of silly to have duplicates around when version control exists.

current_dir=${PWD}

# finding the base directory of the repository
cd "$(git rev-parse --show-toplevel)"

git_base=${PWD}

dotfiles=${git_base}/dotfiles

# Creating necessary directories
mkdir -p ${XDG_CONFIG_HOME}/{tmux,alacritty,nvim,zsh,zathura,mpd,ncmpcpp}

echo "Linking zshrc..."
ln -s ${dotfiles}/zshrc ~/.zshrc &&
echo "success!" || echo "error when linking zshrc..."

echo "Linking zsh plugins..."
ln -s ${dotfiles}/zsh/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking zsh plugins..."

echo "Linking tmux config..."
ln -s ${dotfiles}/tmux/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking tmux config..."

echo "Linking alacritty config..."
ln -s ${dotfiles}/alacritty/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking alacritty config..."

echo "Linking neovim config..."
ln -s ${dotfiles}/nvim/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking neovim config..."

echo "Linking zathurarc..."
ln -s ${dotfiles}/zathura/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking zathurarc..."

echo "Linking mpd config..."
ln -s ${dotfiles}/mpd/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking mpd config..."

echo "Linking ncmpcpp config..."
ln -s ${dotfiles}/ncmpcpp/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking ncmpcpp config..."

echo "Linking rofi config..."
ln -s ${dotfiles}/rofi/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking rofi config..."

echo "Linking fusuma config..."
ln -s ${dotfiles}/fusuma/ ${XDG_CONFIG_HOME} &&
echo "success!" || echo "error when linking fusuma config..."

# returning back to the original directory
cd ${current_dir}
