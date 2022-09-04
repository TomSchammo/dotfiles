#!/usr/bin/env sh

# NOTE: this script is outdated!
#       It installs things that I've not been using for months and is no longer recommended!


set -eu


#######################################################################
# Script to automatically install neovim, with my dotfiles.           #
#                                                                     #
# It is supposed to work on any distro and with any CPU architecture, #
# but it's only working on arch an debian based distros for now.      #
#                                                                     #
#######################################################################

# TODO install neovim using snap store, and download binary option

# TODO since I switched to telescope, I need to make sure that I have a recent neovim version.
#      Unfortunately packages in debian repos are terribly out of date.

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

# TODO snap store is a good alternative, gets new packages (not like apt)
echo "Please choose your preferred method of installation:"

# TODO if 3 is selected, indicating the platform is necessary (arm, amd64, etc)
select CHOICE in "Package Manager" "Build from source" "Download Binary" "Snap Store" "Quit"
do
    case $REPLY in
        1)
            echo "##### Installing neovim using ${PKG_MNGR} #####"
            sudo ${PKG_MNGR_INSTALL} neovim
            ;;
        2)
            echo "##### Building from source #####"

            echo "Installing dependencies..."
            neovim_dependencies="libtool libtool-bin autoconf automake cmake g++ pkg-config unzip gettext"
            sudo ${PKG_MNGR_INSTALL} ${neovim_dependencies}

            if [ ! -x "$(command -v git)" ]; then
                echo "Git is not installed, installing git..."
            fi

            sudo ${PKG_MNGR_INSTALL} git

            cd ~

            echo "Cloning Repository into ${pwd}"

            git clone https://github.com/neovim/neovim.git

            echo "##### Compiling the source code, this might take a while... #####"

            cd neovim

            make CMAKE_BUILD_TYPE=RelWithDebInfo
            sudo make install

            echo "Neovim has been installed sucessfully, cleaning..."

            cd ..

            rm -rf neovim

            echo "Sourcefiles have been removed."

            echo "##### Neovim has sucessfully been compiled ####"

            ;;
        3)
            echo "Downloading Binary" ;;
        4)
            echo "Installing neovim using the snap store" ;;
        5)
            echo "Quitting..."
            exit 0
            ;;
    esac
done


# sudo apt install -y neovim
# sudo pacman -S neovim
# sudo snap install neovim --classic

# alternatively the release binary, cause packages repositories might be behind by quite a lot
# TODO is there a way to get the newest binary?
# https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage

# alternatively build from source, cause the binary won't work on every platform:
#
# installing dependencies
# sudo apt install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip gettext
#
# cloning the repo
# git clone https://github.com/neovim/neovim.git

# compiling the source code
# cd neovim
# make CMAKE_BUILD_TYPE=RelWithDebInfo
# sudo make install


# git for obvious reasons
# sudo apt install -y git

echo "Installing some additional packages..."

# curl to easily get vim-plug and release binaries
sudo ${PKG_MNGR_INSTALL} curl
# sudo apt install -y curl

# node for coc language servers
sudo ${PKG_MNGR_INSTALL} npm

# this is required for node plugins working with neovim?
npm install -g neovim

# python3 is needed for some plugings
sudo ${PKG_MNGR_INSTALL} python3 python3-pip

# this is required for python plugins working with neovim
python3 -m pip install wheel
python3 -m pip install setuptools
python3 -m pip install neovim

# cmake language server
python3 -m pip install cmake-language-server
python3 -m pip install cmakelang

# this is required to support clipboard operations
sudo ${PKG_MNGR_INSTALL} xclip


if [ ${PKG_MNGR} == "pacman" ]; then
    sudo ${PKG_MNGR_INSTALL} ripgrep

elif [ ${PKG_MNGR} == "apt" ]; then
    # desired ripgrep version
    version="12.1.1"

    # download ripgrep binary
    curl -LO "https://github.com/BurntSushi/ripgrep/releases/download/${version}/ripgrep_${version}_amd64.deb"

    # install ripgrep
    sudo dpkg -i ripgrep_${version}_amd64.deb

    # remove binary
    rm ripgrep_${version}_amd64.deb

else
    echo "Package manager ${PKG_MNGR} is not supported..."
fi

# pandoc is needed to compile markdown files to pdf
sudo ${PKG_MNGR_INSTALL} pandoc

# packages for latex support
sudo ${PKG_MNGR_INSTALL} texlive-extra-utils texlive-most

# zathura is used to display pdf files
sudo ${PKG_MNGR_INSTALL} zathura

# cloning my init.vim from github
# TODO 2. check if init.vim has already been downloaded
wget https://raw.githubusercontent.com/TomSchammo/dotfiles/master/dotfiles/init.vim

# TODO check if snippets have been downloaded if not, get them
# TODO move snippets into nvim dir

# creating directory for init.vim
mkdir -p ${HOME}/.config/nvim/

# moving init.vim to the correct location
mv init.vim ${HOME}/.config/nvim/
mv plugin ${HOME}/.config/nvim/

# generating coc-settings.json
(cat <<EOF
{
  "java.jdt.ls.vmargs": "-javaagent:${HOME}/.m2/repository/org/projectlombok/lombok/1.18.10/lombok-1.18.10.jar",
  "clangd.path": "${HOME}/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin/clangd",
  "cSpellExt.enableDictionaries": ["german"],
  "cSpell.language": "de,en",
  "cSpell.userWords": [],
  "snippets.userSnippetsDirectory": "${HOME}/.config/nvim/custom_snippets",
  "languageserver": {
    "cmake": {
      "command": "cmake-language-server",
      "filetypes": ["cmake"],
      "rootPatterns": [
        "build/"
      ],
      "initializationOptions": {
        "buildDirectory": "build"
      }
    }
  },
  "cmake.cmakePath": {
    "type": "string",
    "default": "cmake",
    "description": "Path to CMake generator executable"
  },
  "cmake.formatter": {
    "type": "string",
    "default": "cmake-format",
    "description": "Path to [cmake-format](https://github.com/cheshirekow/cmake_format)"
  },
  "cmake.lsp.enable": {
    "type": "boolean",
    "default": false,
    "description": "Enable language server(https://github.com/regen100/cmake-language-server), Notice that the functionality(completion, formatting, etc.) of lsp and extension builtin can not coexist"
  },
  "cmake.lsp.serverPath": {
    "type": "string",
    "default": "cmake-language-server",
    "description": "Path to [cmake-language-server](https://github.com/regen100/cmake-language-server)"
  },
  "cmake.lsp.buildDirectory": {
    "type": "string",
    "default": "build",
    "description": "See https://github.com/regen100/cmake-language-server#configuration"
  }
  "languageserver": {
    "cmake": {
      "command": "cmake-language-server",
      "filetypes": ["cmake"],
      "rootPatterns": [
        "build/"
      ],
      "initializationOptions": {
        "buildDirectory": "build"
      }
    }
  },
  "cmake.cmakePath": {
    "type": "string",
    "default": "cmake",
    "description": "Path to CMake generator executable"
  },
  "cmake.formatter": {
    "type": "string",
    "default": "cmake-format",
    "description": "Path to [cmake-format](https://github.com/cheshirekow/cmake_format)"
  },
  "cmake.lsp.enable": {
    "type": "boolean",
    "default": false,
    "description": "Enable language server(https://github.com/regen100/cmake-language-server), Notice that the functionality(completion, formatting, etc.) of lsp and extension builtin can not coexist"
  },
  "cmake.lsp.serverPath": {
    "type": "string",
    "default": "cmake-language-server",
    "description": "Path to [cmake-language-server](https://github.com/regen100/cmake-language-server)"
  },
  "cmake.lsp.buildDirectory": {
    "type": "string",
    "default": "build",
    "description": "See https://github.com/regen100/cmake-language-server#configuration"
  }
}
EOF
) > ${HOME}/.config/nvim/coc-settings.json

# install vim-plug
curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# automatically installing plugings
nvim +PlugInstall +q +q

# installing gadgets to debug C, Python and Java
# to enable other languages read the README of vimspector
cd ${HOME}/.config/nvim/autoload/plug.vim/vimspector/

./install_gadget.py --enable-c --enable-python --force-enable-java

