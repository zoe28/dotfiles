# Start tmux
#if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    ssh-agent tmux -2 2> /dev/null
#fi
tmux source ~/.tmux.conf > /dev/null
alias tmux='tmux -2'



# Ruby env
#eval "$(rbenv init -)"


# Grunt Watch - increase number of open files
ulimit -n 10000


# Bash completion
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Git completion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi


# Vim mode in the shell
set -o vi


# Tmux rebindings
stty werase undef
bind -x '"\C-w":tmux kill-window'
alias kp="tmux kill-pane -a"


# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting



# Git commit indicator
parse_git_dirty ()
{
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
parse_git_branch ()
{
    git branch 2> /dev/null | grep '*' | sed "s/*\ \(.*\)/$(parse_git_dirty)\1/"
}

# colored manpages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;31m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[01;44;33m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[01;32m' \
    man "$@"
}

# Bash history
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


# Prompt
# --------------------------------------------------------------------

if [ "$PLATFORM" = Linux ]; then
  PS1="\[\e[1;38m\]\u\[\e[1;34m\]@\[\e[1;31m\]\h\[\e[1;30m\]:"
  PS1="$PS1\[\e[0;38m\]\w\[\e[1;35m\]> \[\e[0m\]"
else
  ### git-prompt
  __git_ps1() { :;}
  if [ -e ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
  fi
  PROMPT_COMMAND='history -a; printf "\[\e[38;5;59m\]%$(($COLUMNS - 4))s\r" "$(__git_ps1) ($(date +%m/%d\ %H:%M:%S))"'
  PS1="\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:"
  PS1="$PS1\[\e[m\]\w\[\e[1;31m\]> \[\e[0m\]"
fi


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

# vim love
alias v="vim"
alias va="vim -o" # multiple files in splits
alias vd="vim -d" # diff

# python love
alias py="python"

# process
alias ps="ps aux"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# file sizes
alias du="du -hs | sort -h"

# use versions when in repo
function mv {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1 ; then
      git mv -v $@ 2> /dev/null || $(which mv) -iv $@
  else
      $(which mv) -iv $@
  fi
}

function rm {
  ARGS=$@

  # backup
  while [ ! $# -eq 0 ]                            # while there are arguments
  do
    if [[ $1 != "-"* ]] ; then                    # if not an inline argument
      BACKUP_FILE_NAME="${1%/}.tar.bz2"           # create back-up file-name (breaks for dirs)
      if [ -f $BACKUP_FILE_NAME ]; then           # if the file exists
        tar -jcf $BACKUP_FILE_NAME $1             # tar
        mv -f $BACKUP_FILE_NAME /tmp > /dev/null  # move tar to /tmp (and shut up)
      fi
    fi
    shift                                         # next argument
  done

  if git rev-parse --is-inside-work-tree > /dev/null 2>&1 ; then
      git rm $ARGS 2> /dev/null || $(which rm) -iv $ARGS
  else
      $(which rm) -iv $ARGS
  fi
}

alias cp='cp -v'

# virtualenv shortcut
alias virtualize='source bin/activate'

# prompt if overwriting file
alias mkdir='mkdir -v'

# silly salt
alias salt='sudo salt'

# Program defaults
alias bundleupdate='vim -c BundleUpdate -c qa'

# Typos
alias suod='sudo'
alias sduo='sudo'
alias vm='mv'
alias sl='ls'
alias got='git'
alias grp='grep'

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

COLOR="--color=auto"
alias ls='ls -F $COLOR'    #colors
alias ll='ls -lsah $COLOR'  #long list
alias lr='ls -lR'                #recursive
alias tree='tree -Csuh'          #alternative to recursive ls
alias df='df -kTh'
alias path='echo -e ${PATH//:/\\n}'
alias grep='grep $COLOR'

# cd aliases
alias cs='cd'
alias ~='cd ~'
alias ..='cd ..'        #go to parent dir
alias ...='cd ../..'    #go to grandparent dir
alias ....='cd ../../..'    #go to great-grandparent dir
alias .....='cd ../../../..'    #go to great-great-grandparent dir

# push & pop directory
alias st='pushd $(pwd) -n'
alias ba='popd'

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
alias raw='cd ~/raw/code'
alias dots='cd ~/dotfiles'

# find public IP
alias myip='curl ip.appspot.com'

# nethack
alias nethack='telnet nethack.alt.org'


# Git
# --------------------------------------------------------------------

# git love
alias cm='ag "<<<<<<<"'
alias g="git"
alias ga="git add -p"
alias gbc="echo Total branches: `git branch | wc -l`"
alias gd="clear ; git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
#alias gls="git log --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --stat"
alias gm="git mergetool"
alias gom="git push ; git checkout master"
alias gpl="git pull"
alias gps="git push"
alias gs="git status -sb"
alias gso="git diff --name-status origin/master"
alias gv="git vimdiff"
alias reset='git stash'
alias stash="git add ; git stash"
alias throwaway='git reset --hard HEAD'

function gdo {
  BRANCH_NAME=`git symbolic-ref --short HEAD`
  git diff origin/$BRANCH_NAME
}

# display all branches that match the parameter
gb () {
  if [ $# -eq 0 ] ; then
    git branch
  else
    git branch | grep "$1"
  fi
}

# double-check that you really want to commit to master
gc () {
  BRANCH_NAME=`git symbolic-ref --short HEAD`
  if [ "$BRANCH_NAME" = "master" ] ; then
    read -p "Are you sure you want to commit to master? [y/n] " -n 1 CONFIRM
    echo ""
    if [ "$CONFIRM" = "y" ] ; then
      git add -p ; git commit
    fi
  else
    git add -p ; git commit
  fi
}

function squash {
  git rebase -i HEAD~$1
}

alias sq='squash'
alias sq2='squash 2'

# remove old branches that have already been merged into master
gclean () {
  DATE=`date -v-1m +%m-%d-%Y` # default date is 1 month ago
  DRY_RUN=""
  CURRENT_BRANCH=`git symbolic-ref --short HEAD`
  BRANCHES=0

  while [[ $# > 0 ]]
  do
  KEY="$1"

  case $KEY in
    # user can pass in a date
    -d|--date)
    DATE="$2"
    ;;
    # show what gets deleted
    --dry|--dry-run)
    DRY_RUN=1
    ;;
  esac
  shift
  done

  for BRANCH in $(git branch --merged | grep -v $CURRENT_BRANCH) ; do
    if [[ "$(git log $BRANCH --since $DATE | wc -l)" -eq 0 ]] ; then
      echo "$BRANCH"
      ((BRANCHES++))
    fi
  done

  if [[ -z "$DRY_RUN" ]] ; then
    echo -e "\n$BRANCHES merged branches stale since $DATE"
    if [[ $BRANCHES -gt 0 ]] ; then
      read -p "Do you want to delete all older merged branches? [y/n] " -n 1 CONFIRM
      echo ""
      if [ "$CONFIRM" = "y" ] ; then
        for BRANCH in $(git branch --merged | grep -v $CURRENT_BRANCH) ; do
          if [[ "$(git log $BRANCH --since $DATE | wc -l)" -eq 0 ]] ; then
            git branch -D $BRANCH
          fi
        done
      fi
    fi
  fi
}

alias go="git checkout"
# check out the branch matching the parameter
gob () {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf-tmux -d 15 +m) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

# show details of last commit
gq () {
  git show :/$1
}

# check for merge conflicts before continuing
grc () {
  CONFLICT=`ag "<<<<<<<"`
  if [ -z "$CONFLICT" ] ; then
    git add . ; git rebase --continue
  else
    echo "$CONFLICT"
    read -p "There are still merge conflicts. Do you want to merge? [y/n] " -n 1 CONFIRM
    echo ""
    if [ "$CONFIRM" = "y" ] ; then
      git add . ; git rebase --continue
    fi
  fi
}



# fuzzy typos
shopt -s cdspell


# better cd
cd() {
  builtin cd $@;
  ls -F $COLOR;
}


# mkdir and then enter folder
md() {
  mkdir -p $1 && cd $1
}
alias mkdir="mkdir -p"


## fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'

vs() {
  if [ $# -eq 0 ] ; then
    FILENAME=$(fzf -1 -m -i)
  else
    FILENAME=$(fzf -1 -m -i -q $@)
  fi
  if [ -n "$FILENAME" ] ; then
    vim -o $FILENAME
  fi
}

export fzf='
  (git ls-tree -r --name-only HEAD ||
   find * -name ".*" -prune -o -type f -print -o -type l -print) 2> /dev/null'

# fshow - git commit browser
fshow() {
  local out sha q
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" --print-query); do
    q=$(head -1 <<< "$out")
    while read sha; do
      git show --color=always $sha | less -R
    done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
  done
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
      -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}


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


## open all files containing query
vg() {
  if [ ! $# -eq 0 ] ; then
    vim -o $(ag -l $@)
  fi
}


## nvm
export NVM_DIR="/Users/zhangb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


## TCP ports
# show TCP unly (no UDP), and don't translate IP addrs and ports numbers to names
alias tcpports="sudo lsof -i tcp -nP"

if [[ $OSTYPE == darwin* ]]; then
  source ~/.bash_osx
fi
