# Python
# --------------------------------------------------------------------
if which pyenv > /dev/null; then
  eval "$(pyenv init -)";
fi

#export PYTHONSTARTUP=$HOME/.pythonstartup


# Ruby
# --------------------------------------------------------------------
#eval "$(rbenv init -)"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


# Desk
# --------------------------------------------------------------------
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
alias d.="desk . ${PWD##*/}"


# Bash completion
# --------------------------------------------------------------------
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Git completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi


# Vim mode in the shell
set -o vi


# TMUX
# --------------------------------------------------------------------
stty werase undef
bind -x '"\C-w":tmux kill-window'                # Ctrl-w to kill pane
alias kp="tmux kill-pane -a"



# FZF
# --------------------------------------------------------------------
export fzf='
  (git ls-tree -r --name-only HEAD ||
   find * -name ".*" -prune -o -type f -print -o -type l -print) 2> /dev/null'

## fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash



# Bash history
# --------------------------------------------------------------------
# don't put/gduplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend


# Window
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Virtual Env
# --------------------------------------------------------------------
export WORKON_HOME=~/.virtualenvs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export PATH=/usr/local/bin:$PATH
  source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/virtualenvwrapper.sh ]; then
  export PATH=/usr/bin:$PATH
  source /usr/bin/virtualenvwrapper.sh
fi
export EDITOR=vim

vn () {
  if [ -f ./env/bin/activate ]; then
    source ./env/bin/activate
  fi
}

# Things for python virtualenv
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true


# Aliases
# --------------------------------------------------------------------


# process
alias ps="ps aux"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# file sizes
alias du="du -hs | sort -h"

alias cp='cp -v'

# virtualenv shortcut
alias virtualize='source bin/activate'

# prompt if overwriting file
alias mkdir='mkdir -v'

# Program defaults
alias bundleupdate='vim -c BundleUpdate -c qa'

# Open folder in Finder
alias f='open -a Finder ./'
alias o='open'

# Clear
alias clr='clear'

# pep8 shortcut
alias pep8='pep8 --show-source --show-pep8 '

# kill of my proceses (useful once in a while because disconnects don't kill them)
alias killall='pkill -u $USER'

# delete all .swp files
alias rmswp='rm -rf ~/.vim/swap/*.swp'

# auto resize tmux window
alias resize='tmux detach -a'
alias share='tmux new-session -t 0'

alias ls='ls -F --color=auto'    #colors
alias ll='ls -lsah --color=auto'  #long list
alias lr='ls -lR'                #recursive
alias tree='tree -Csuh'          #alternative to recursive ls
alias df='df -kTh'
alias path='echo -e ${PATH//:/\\n}'
alias grep='grep --color=auto'

# .*rc files
alias agrc='vim ~/.agignore'
alias aliasrc='vim ~/.alias'
alias bashrc='vim ~/.bashrc'
alias inputrc='vim ~/.inputrc'
alias gitrc='vim ~/.gitconfig'
alias screenrc='vim ~/.screenrc'
alias tmuxrc='vim ~/.tmux.conf'
alias vimrc='vim ~/.vimrc'

re () {
  source ~/.bashrc

  if [ -f ~/.alias ]; then
    source ~/.alias
  fi

  echo "sourced .rc files"
}

# alias directories
alias raw='cd ~/raw'
alias dots='cd ~/dotfiles'

# find public IP
alias myip='curl ip.appspot.com'

# nethack
alias nethack='telnet nethack.alt.org'



# fuzzy typos
shopt -s cdspell



# mkdir and then enter folder
md() {
  mkdir -p $1 && cd $1
}
alias mkdir="mkdir -p"


## unzip everything
extract () {
  if [ -f $1 ] ; then
  case $1 in
    *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *)     echo "'$1' cannot be extracted" ;;
     esac
 else
   echo "'$1' is not a valid file"
 fi
}


## search and replace all in files recursively
replaceall () {
  find . -type f -exec sed -e "s/$1/$2/g" -i '' '{}' +
}



## nvm
export NVM_DIR="/Users/zhangb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


## TCP ports
# show TCP unly (no UDP), and don't translate IP addrs and ports numbers to names
alias tcpports="sudo lsof -i tcp -nP"


# Cocos2d-x
# --------------------------------------------------------------------
alias cocos="/Users/brian/Armory/cocos2d-x-3.13.1/tools/cocos2d-console/bin/cocos.py"

# Source more bash files
# --------------------------------------------------------------------
source ~/.bash_alias
source ~/.bash_cd
source ~/.bash_git
source ~/.bash_ps1

if [[ $OSTYPE == darwin* ]]; then
  source ~/.bash_osx
fi


. /Users/brian/torch/install/bin/torch-activate
