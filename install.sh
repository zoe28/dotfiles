#!/bin/env bash

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

# Mac OS X
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

    # Install Tmux
    if [ ! -d "/usr/local/Cellar/tmux" ]; then
        echo "Installing tmux"
        brew install tmux
    else
        echo "tmux already installed"
    fi

    # Install Autoenv
    if [ ! -d "/usr/local/Cellar/autoenv" ]; then
        echo "Installing autoenv"
        brew install autoenv
    else
        echo "autoenv already installed"
    fi

    # Install fzf
    if [ ! -d "/usr/local/Cellar/fzf" ]; then
        echo "Installing fzf"
        brew reinstall --HEAD fzf
        bash /usr/local/Cellar/fzf/HEAD/install
    else
        echo "fzf already installed"
    fi

    # Install Node.js
    if [ ! -d "/usr/local/Cellar/node" ]; then
        echo "Installing node"
        brew install node
        sudo npm install -g grunt-cli
    else
        echo "node already installed"
    fi

    # Install Bash Completion
    if [ ! -d "/usr/local/Cellar/bash-completion" ]; then
        echo "Installing bash completion"
        brew install bash-completion
    else
        echo "bash completion already installed"
    fi

    # Install Silver Searcher
    if [ ! -d "/usr/local/Cellar/the_silver_searcher" ]; then
        echo "Installing silver searcher"
        brew install the_silver_searcher
    else
        echo "silver searcher already installed"
    fi

    # Install htop
    if [ ! -d "/usr/local/Cellar/htop-osx" ]; then
        echo "Installing htop"
        brew install htop
    else
        echo "htop already installed"
    fi

    # Install fasd
    if [ ! -d "/usr/local/Cellar/fasd" ]; then
        echo "Installing fasd"
        brew install fasd
    else
        echo "fasd already installed"
    fi

    # Install Reattach-to-user-namespace
    if [ ! -d "/usr/local/Cellar/reattach-to-user-namespace" ]; then
        echo "Installing reattach-to-user-namespace"
        brew install reattach-to-user-namespace
    else
        echo "reattach-to-user-namespace already installed"
    fi

    # Install Tmux Plugin Manager
    if [ ! -d "~/.tmux" ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
fi

# Linux
if [[ $OSTYPE == linux-gnu ]]; then
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

# git-prompt
if [ ! -e ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

# Cleanup

mkdir -p "$HOME/.vim/"{bundle,swap,backup,undo}

source ~/.bashrc

popd &> /dev/null
