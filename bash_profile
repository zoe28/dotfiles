if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.tmux.conf ]; then
  tmux source ~/.tmux.conf > /dev/null

  if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    ssh-agent tmux 2> /dev/null
  fi
fi

export PLATFORM=$(uname -s)
if [ "$PLATFORM" = 'Darwin' ]; then
  source ~/.bash_osx
fi

if [ -f ~/.alias ]; then
  source ~/.alias
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Add coreutils
export CORE_UTILS=/usr/local/opt/coreutils/libexec/gnubin
export PATH=$CORE_UTILS:$PATH
