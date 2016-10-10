if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.tmux.conf ]; then
  tmux source ~/.tmux.conf > /dev/null
  alias tmux='tmux -2'

  if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    ssh-agent tmux -2 2> /dev/null
  fi
fi

export PLATFORM=$(uname -s)
if [ "$PLATFORM" = 'Darwin' ]; then
  source ~/.bash_osx
fi

if [ -f ~/.alias ]; then
  source ~/.alias
fi
