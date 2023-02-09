#!/bin/bash

# define color codes
ERROR='\033[0;31m'
SUCCESS='\033[0;32m'
NC='\033[0m'

# This scrip links the dotfiles from the repository into their respective place.
# Symbolic links are created instead of moving or copying the files since it
# seems kind of silly to have duplicates around when version control exists.

current_dir=${PWD}

# finding the base directory of the repository
cd "$(git rev-parse --show-toplevel)"

git_base=${PWD}

dotfiles=${git_base}/dotfiles

# Creating necessary directories
# mkdir -p ${XDG_CONFIG_HOME}/{tmux,alacritty,nvim,zsh,zathura,mpd,ncmpcpp}

echo "Linking zshrc..."
ln -s "${dotfiles}"/zshrc "${HOME}"/.zshrc &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking zshrc...${NC}"

echo "Linking zsh plugins..."
ln -s "${dotfiles}"/zsh/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking zsh plugins...${NC}"

echo "Linking tmux config..."
ln -s "${dotfiles}"/tmux/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking tmux config...${NC}"

echo "Linking alacritty config..."
ln -s "${dotfiles}"/alacritty/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking alacritty config...${NC}"

echo "Linking neovim config..."
ln -s "${dotfiles}"/nvim/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking neovim config...${NC}"

echo "Linking zathurarc..."
ln -s "${dotfiles}"/zathura/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking zathurarc...${NC}"

echo "Linking mpd config..."
ln -s "${dotfiles}"/mpd/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking mpd config...${NC}"

echo "Linking ncmpcpp config..."
ln -s "${dotfiles}"/ncmpcpp/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking ncmpcpp config...${NC}"

echo "Linking rofi config..."
ln -s "${dotfiles}"/rofi/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking rofi config...${NC}"

echo "Linking fusuma config..."
ln -s "${dotfiles}"/fusuma/ "${XDG_CONFIG_HOME}" &&
    echo "${SUCCESS}success!${NC}" || echo "${ERROR}error when linking fusuma config...${NC}"

# returning back to the original directory
cd "${current_dir}"
