#!/usr/bin/env sh
set -eu

cd ~

# creating directory for the alacritty config
mkdir -p ~/.config/alacritty/

# some alacritty dependencies and git to clone the repository
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 git

# installing rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# clone the repo
git clone https://github.com/alacritty/alacritty.git

cd alacritty

# build alacritty and place it into the right directory
cargo build --release && sudo cp target/release/alacritty /usr/local/bin/

cd ~

# cleaning home directory
rm -rf alacritty

# copying config into the right directory
mv ~/dotfiles/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
