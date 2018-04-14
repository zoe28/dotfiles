#!/bin/bash

name=${0##*/}

function print_help() {
  echo -e "usage: $name [options]

  optional args:

  -h|--help     print this help."
}

OPTS=$(getopt -o pbh --long help -n "$name" -- "$@")

if [ $? != 0 ]; then echo -e "option error" >&2; exit 1; fi

eval set -- "$OPTS"

while true; do
  case "$1" in
    -h|--help)
      print_help
      exit 0
      ;;
    --)
      shift; break;;
    *)
      echo -e "Internal error!"; exit 1;;
  esac
done

pushd $(dirname $0) &> /dev/null



# create symlinks for each dotfile

for dot in $(ls); do
  if [ ! "$dot" == "README.rst" ] && [ ! "$dot" == "install.sh" ] && [ ! "$dot" == "config.ctags" ]; then
    target="$HOME/.$dot"

    # Make a .bak of a file or dir
    if [ ! -h "$target" ]; then
      if [ -d "$target" -o -f "$target" ]; then
        mv "$target" "$target.bak"
      fi
    fi

    echo -e "Setting $dot"
    ln -sf "$PWD/$dot" "$target"
  fi
done

if [ ! -d "$HOME/.ctags.d" ] ; then
  mkdir -p "$HOME/.ctags.d"
fi

ln -sf "$PWD/config.ctags" "$HOME/.ctags.d/config.ctags"



## Mac OS X
if [[ $OSTYPE == darwin* ]]; then
  # show hidden files in Finder
  defaults write com.apple.finder AppleShowAllFiles YES

  # Cmd-Q Finder
  defaults write com.apple.finder QuitMenuItem -bool YES && killall Finder

  # Install Homebrew
  if [ ! -d "/usr/local/Cellar" ]; then
    echo -e "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo -e "Homebrew already installed"
  fi

  if [ -d "/usr/local/Cellar" ]; then
    echo -e "Installing brew packages. This could take a while..."
    < brew.txt xargs brew install
  fi

  # Install vim-plug and all plugins
  if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim -c PlugInstall -c qa &> /dev/null
  fi

  # Install universal ctags
  if [ ! -d "/usr/local/Cellar/universal-ctags" ]; then
    brew reinstall --HEAD universal-ctags/universal-ctags/universal-ctags
  fi

  # Install Tmux Plugin Manager
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  # Install global NPM cli
  if [ -d "/usr/local/Cellar/node" ]; then
    echo -e "Installing npm global packages. This could take a while..."
    < npm_globals.txt xargs npm install -g
  fi
fi



## Linux
if [[ $OSTYPE == linux-gnu ]]; then
  # Install pip
  if [ ! -x "/usr/bin/pip" ]; then
    echo -e "Installing pip"
    sudo apt-get install python-pip
  else
    echo -e "pip already installed"
  fi

  # Install tmux
  if [ ! -x "/usr/bin/tmux" ]; then
    echo -e "Installing tmux"
    sudo apt-get install tmux
  else
    echo -e "tmux already installed"
  fi

  # Install Silver Searcher
  if [ ! -x "/usr/bin/ag" ]; then
    echo -e "Installing silver searcher"
    sudo apt-get install silversearcher-ag
  else
    echo -e "silver searcher already installed"
  fi
fi



## git-prompt
if [ ! -e ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi



## Python

# Pip
echo -e "\\nsudo pip install "
export PIP_REQUIRE_VIRTUALENV=false
export PIP_RESPECT_VIRTUALENV=false
sudo pip install flake8
sudo pip install pylint-django
sudo pip install pyscope
sudo pip install virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true



## Cleanup

mkdir -p "$HOME/.vim/"{bundle,swap,backup,undo}

source ~/.bashrc

popd &> /dev/null

echo -e "\\nPackages Installed"
echo -e "\\nNext Steps:"
echo -e "1) Enter ~/.vimrc and run :PlugInstall"
echo -e "2) Set the Terminal font to 'Source Code Pro for Powerline'"
echo -e "3) Set the Terminal color scheme to ~/.vim/plugged/seoul256-iTerm/seoul256.itermcolors"
