#!/usr/bin/env sh
set -eu

cd ~

# creating directory for the alacritty config
mkdir -p ~/.config/alacritty/

# some alacritty dependencies and git to clone the repository
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 git

# install the snapstore to get rustup
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install -y snapd && sudo snap install rustup --classic

rustup override set stable && rustup update stable

# clone the repo
git clone https://github.com/alacritty/alacritty.git

cd alacritty

# build alacritty and place it into the right directory
cargo build --release && sudo cp target/release/alacritty /usr/local/bin/

# removing all snap stuff cause it sucks
sudo apt purge snap -y
rm -rf ~/snap

cd ~

# cleaning home directory
rm -rf alacritty

if ! [ -r "~/dotfiles" ]
then
    git clone https://github.com/TomSchammo/dotfiles.git
fi

# copying config into the right directory
mv ~/dotfiles/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
