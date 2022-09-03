# This scrip links the dotfiles from the repository into their respective place.
# Symbolic links are created instead of moving or copying the files since it
# seems kind of silly to have duplicates around when version control exists.

# Creating necessary directories

current_dir=${PWD}

# finding the base directory of the repository
cd "$(git rev-parse --show-toplevel)"

git_base=${PWD}

dotfiles=${git_base}/dotfiles/

mkdir -p ${XDG_CONFIG_HOME}/{tmux,alacritty,nvim,zsh,zathura,mpd,ncmpcpp}

echo "Linking zshrc..."
ln -s ${dotfiles}/zshrc ~/.zshrc &&
echo "success!" || echo "error when linking zshrc..."

echo "Linking tmux config..."
ln -s ${dotfiles}/tmux.conf ${XDG_CONFIG_HOME}/tmux/ &&
echo "success!" || echo "error when linking tmux config..."

echo "Linking alacritty config..."
ln -s ${dotfiles}/alacritty.yml ${XDG_CONFIG_HOME}/alacritty/ &&
echo "success!" || echo "error when linking alacritty config..."

echo "Linking neovim config..."
ln -s ${dotfiles}/init.vim ${XDG_CONFIG_HOME}/nvim/ &&
ln -s ${dotfiles}/plugin/ ${XDG_CONFIG_HOME}/nvim/ &&
echo "success!" || echo "error when linking neovim config..."

echo "Linking zathurarc..."
ln -s ${dotfiles}/zathurarc ${XDG_CONFIG_HOME}/zathura/ &&
echo "success!" || echo "error when linking zathurarc..."

echo "Linking mpd config..."
ln -s ${dotfiles}/mpd.conf ${XDG_CONFIG_HOME}/mpd/ &&
echo "success!" || echo "error when linking mpd config..."

echo "Linking ncmpcpp config..."
ln -s ${dotfiles}/ncmpcpp_config ${XDG_CONFIG_HOME}/ncmpcpp/config &&
echo "success!" || echo "error when linking ncmpcpp config..."

# returning back to the original directory
cd ${current_dir}
