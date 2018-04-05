" ----------------------------------------------------------------------------
" UI
" ----------------------------------------------------------------------------

set autochdir
set autoread                   " auto reload if file saved externally
set backspace=indent,eol,start " fixes a problem where I cannot delete text that is existing in the file
set ch=1                       " command line height
set colorcolumn=100            " vertical line to indicate line width
set complete-=i                " don't autocomplete from included files
set encoding=utf-8             " Enable unicode
set et
set expandtab                  " all tabs are actually spaces
set iskeyword=-                " hyphens are word boundaries
set laststatus=2               " always show status line
set lazyredraw                 " if we're going to redraw, lets not be lazy about it.
set nocompatible
set nostartofline              " don't jump to the start of a line when scrolling
set number                     " show line numbers
set report=0                   " tell us about changes
set scrolloff=5                " keep cursor 5 lines away from the edge of the screen
set shiftwidth=2
set showcmd                    " display commands as I type them
set showmode                   " show the current mode
set smartindent
set softtabstop=2              " two!
set timeoutlen=300
set ttimeoutlen=10
set ttimeoutlen=50             " timeout length when switching modes
set ttyfast
set whichwrap=b,s,h,l,<,>,[,]  " wrap on other things
set wildignore+=*.class        " ignore java compiled files
set wildignore+=*.pyc          " ignore python compiled files
set wildignore+=*.swp          " ignore vim backups
set wildignore+=.git,.hg,.svn  " ignore version control repos
set wildmenu                   " turn on wild menu. Sounds fun.
set wildmode=longest:list,full " make tab completion act like bash, but even better!
syntax enable                  " turn on Syntax highlighting
syntax sync minlines=1000      " look for synchronization points 1000 lines before the current position in the file.



" ----------------------------------------------------------------------------
" Visual stuff
" ----------------------------------------------------------------------------

set background=dark   " We use a dark terminal so we can play nethack
set mat=5             " show matching brackets for 1/10 of a second
set laststatus=2      " always have a file status line at the bottom, even when theres only one file
set visualbell        " Stop beeping
set virtualedit=block " Allow virtual edit in just block mode.



" ----------------------------------------------------------------------------
" Backup/Undo settings
" ----------------------------------------------------------------------------

execute "set directory=" . g:vim_home_path . "/swap"
execute "set backupdir=" . g:vim_home_path . "/backup"
execute "set undodir="   . g:vim_home_path . "/undo"

set backup
set writebackup
set undofile


" ----------------------------------------------------------------------------
" Searching and replacing
" ---------------------------------------------------------------------------

set showmatch                    " brackets/brace matching
set incsearch                    " show me whats matching as I type my search
set hlsearch                     " Highlight search results


" ----------------------------------------------------------------------------
" TMUX
" ----------------------------------------------------------------------------

if exists('$TMUX')
  set clipboard=
else
  set clipboard=unnamed  " sync with OS clipboard
endif


" ----------------------------------------------------------------------------
" Tags
" ----------------------------------------------------------------------------

set tags=./tags;~/src
