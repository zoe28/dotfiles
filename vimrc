" ----------------------------------------------------------------------------
" Leader key
" ----------------------------------------------------------------------------
let mapleader = " "


" ----------------------------------------------------------------------------
" Path
" ----------------------------------------------------------------------------
set path=~/**


" ----------------------------------------------------------------------------
" Load external files
" ----------------------------------------------------------------------------
source ~/.vimplugins
source ~/.vimsetmap


" ----------------------------------------------------------------------------
" Autocmds
" ----------------------------------------------------------------------------

autocmd BufEnter * :syntax sync fromstart
filetype on
filetype plugin indent on

if exists('$TMUX')
  set clipboard=
else
  set clipboard=unnamed        "sync with OS clipboard
endif

hi NonText cterm=NONE ctermfg=NONE


" ----------------------------------------------------------------------------
" Searching and replacing
" ---------------------------------------------------------------------------

set showmatch                    " brackets/brace matching
set incsearch                    " show me whats matching as I type my search
set hlsearch                     " Highlight search results

" prepend all searches with \v to get rid of vim's 'crazy default regex characters'
nnoremap / /\v
" make tab % in normal mode. This allows us to jump between brackets.
nnoremap <tab> %
" make tab % in visual mode. this allows us to jump between brackets.
vnoremap <tab> %


" ---------------------------------------------------------------------------
" Python Stuff
" ---------------------------------------------------------------------------
" Gonna use 2 spaces for a while
autocmd FileType python setl sw=2                    " For python, the shift width is four, yes four
autocmd FileType python set softtabstop=2            " For python, tabs are four spaces!
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class " Autoindent my new blocks in python
highlight SpellBad term=reverse ctermbg=1


" ---------------------------------------------------------------------------
" Code Folding"
" ---------------------------------------------------------------------------
set foldmethod=indent
set foldnestmax=99
set foldlevel=3
let javaScript_fold=1


"" Python
if has('python')
python << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
endif


"" ctags
set tags=./tags;~/src


" Spell check README's
autocmd BufRead,BufNewFile *.md setlocal spell
