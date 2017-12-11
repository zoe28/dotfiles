# Bash
# --------------------------------------------------------------------
# Vim mode in the shell
set -o vi

shopt -s cdspell

# tab completion
bind TAB:menu-complete



# Bash completion
# --------------------------------------------------------------------
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi



# Bash history
# --------------------------------------------------------------------
# don't put/gduplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

export HISTFILESIZE=10000000
export HISTSIZE=10000000

# append to the history file, don't overwrite it
shopt -s histappend



# Desk
# --------------------------------------------------------------------
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
alias d.="desk . ${PWD##*/}"



# FZF
# --------------------------------------------------------------------
export fzf='
  (git ls-tree -r --name-only HEAD ||
   find * -name ".*" -prune -o -type f -print -o -type l -print) 2> /dev/null'

## fzf
#export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash



# Git completion
# --------------------------------------------------------------------
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi



# Less
# --------------------------------------------------------------------
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



# Node
# --------------------------------------------------------------------
# Node Virtual Machine
export NVM_DIR="/Users/zhangb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm



# Perl
# --------------------------------------------------------------------
if [ -f "~/.perlrc" ]; then
  source ~/.perlrc
fi



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



# Tmux
# --------------------------------------------------------------------
stty werase undef
bind -x '"\C-w":tmux kill-window'                # Ctrl-w to kill pane
alias kp="tmux kill-pane -a"



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

export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true



# Window
# --------------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize






# Source more bash files
# --------------------------------------------------------------------
source ~/.bash_alias
source ~/.bash_cd
source ~/.bash_git
source ~/.bash_ps1

if [[ $OSTYPE == darwin* ]]; then
  source ~/.bash_osx
fi
