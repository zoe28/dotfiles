" -------------------------------------------------------------------------------------------------
" Leader key
" -------------------------------------------------------------------------------------------------
let mapleader = " "



" -------------------------------------------------------------------------------------------------
" Path
" -------------------------------------------------------------------------------------------------
set path=.,**
"set path=~/**



" -------------------------------------------------------------------------------------------------
" Files
" -------------------------------------------------------------------------------------------------
:set autoread



" -------------------------------------------------------------------------------------------------
" Autocmds
" -------------------------------------------------------------------------------------------------
autocmd BufEnter * :syntax sync fromstart
filetype on
filetype plugin indent on

hi NonText cterm=NONE ctermfg=NONE



" -------------------------------------------------------------------------------------------------
" Python Stuff
" -------------------------------------------------------------------------------------------------
" Gonna use 2 spaces for a while
autocmd FileType python setl sw=2                    " For python, the shift width is two, yes two
autocmd FileType python set softtabstop=2            " For python, tabs are two spaces
" Autoindent my new blocks in python
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

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



" -------------------------------------------------------------------------------------------------
" Code Folding
" -------------------------------------------------------------------------------------------------
set foldmethod=indent
set foldnestmax=99
set foldlevel=3



" -------------------------------------------------------------------------------------------------
" File Explorer
" -------------------------------------------------------------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3



" -------------------------------------------------------------------------------------------------
" Session Management
" -------------------------------------------------------------------------------------------------
" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
	\ call mkdir($HOME . "/.vim") |
	\ endif |
	\ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
	\ execute "source " . $HOME . "/.vim/Session.vim"



" -------------------------------------------------------------------------------------------------
" Load external files
" -------------------------------------------------------------------------------------------------
source ~/.plugs.vim   " needs to come first

source ~/.set.vim
source ~/.map.vim
source ~/.autocmd.vim
