if [ -f ~/.profile ]; then
   source ~/.profile
fi
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
if [ -f ~/.alias ]; then
   source ~/.alias
fi

source /usr/local/opt/autoenv/activate.sh
