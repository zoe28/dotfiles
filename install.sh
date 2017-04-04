#!/bin/bash

name=${0##*/}

function print_help() {
echo "usage: $name [options]

optional args:

-b|--bundle   run :BundleUpdate after install.
-h|--help     print this help."
            }

bundleupdate=0
OPTS=$(getopt -o pbh --long bundle,help -n "$name" -- "$@")

if [ $? != 0 ]; then echo "option error" >&2; exit 1; fi

eval set -- "$OPTS"

while true; do
    case "$1" in
        -b|--bundle)
            bundleupdate=1
            shift;;
        -h|--help)
            print_help
            exit 0
            ;;
        --)
            shift; break;;
        *)
            echo "Internal error!"; exit 1;;
    esac
done

pushd $(dirname $0) &> /dev/null

for dot in $(ls); do
    if [ ! $dot == "README.rst" -a ! $dot == "install.sh" ]; then
        target="$HOME/.$dot"

        # Make a .bak of a file or dir
        if [ ! -h $target ]; then
            if [ -d $target -o -f $target ]; then
                mv $target $target.bak
            fi
        fi

        echo "Setting $dot"
        ln -sf "$PWD/$dot" "$target"
    fi
done

if [[ $OSTYPE == darwin* ]]; then
    # Install Vim
    if [ ! -d "/usr/local/Cellar/vim" ]; then
        echo "Installing vim"
        brew install vim
    else
        echo "vim already installed"
    fi
fi

# Install vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install Vundle (obsolete)
if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
    echo "Installing vundle"
    git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle" &> /dev/null
    if [[ $bundleupdate -eq 0 ]]; then
        echo "Installing Bundles"
        vim +BundleInstall +qall
    fi
else
    echo "Vundle already installed"
fi

if [[ $bundleupdate -eq 1 ]]; then
    echo "Running bundle update"
    vim -c BundleUpdate -c qa &> /dev/null
fi



## Mac OS X
if [[ $OSTYPE == darwin* ]]; then
    # show hidden files in Finder
    defaults write com.apple.finder AppleShowAllFiles YES

    # Cmd-Q Finder
    defaults write com.apple.finder QuitMenuItem -bool YES && killall Finder

    # Install Homebrew
    if [ ! -d "/usr/local/Cellar" ]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Homebrew already installed"
    fi

    if [ -d "/usr/local/Cellar" ]; then
      echo "Installing brew packages. This could take a while..."
      < brew.txt xargs brew install
    fi

    # Install fzf
    if [ ! -d "/usr/local/Cellar/fzf" ]; then
        brew reinstall --HEAD fzf
        bash /usr/local/Cellar/fzf/HEAD/install
    fi

    # Install Node.js
    if [ ! -d "/usr/local/Cellar/node" ]; then
        sudo npm install -g grunt-cli
    fi

    # Install Tmux Plugin Manager
    if [ ! -d "~/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
fi



## Linux
if [[ $OSTYPE == linux-gnu ]]; then
    # Install pip
    if [ ! -x "/usr/bin/pip" ]; then
        echo "Installing pip"
        sudo apt-get install python-pip
    else
        echo "pip already installed"
    fi

    # Install tmux
    if [ ! -x "/usr/bin/tmux" ]; then
        echo "Installing tmux"
        sudo apt-get install tmux
    else
        echo "tmux already installed"
    fi

    # Install Silver Searcher
    if [ ! -x "/usr/bin/ag" ]; then
        echo "Installing silver searcher"
        sudo apt-get install silversearcher-ag
    else
        echo "silver searcher already installed"
    fi
fi



## git-prompt
if [ ! -e ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi



## Python

# Pip
export PIP_REQUIRE_VIRTUALENV=false
export PIP_RESPECT_VIRTUALENV=false
pip install virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true



## Cleanup

mkdir -p "$HOME/.vim/"{bundle,swap,backup,undo}

source ~/.bashrc

popd &> /dev/null
