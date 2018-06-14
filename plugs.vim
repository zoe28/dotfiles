" ----------------------------------------------------------------------------
" Vim Plug
" ----------------------------------------------------------------------------

" Configuration
if has("win32")
  let g:vim_home_path = "~/vimfiles"
else
  let g:vim_home_path = "~/.vim"
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

                                                                 " == General ==
Plug 'junegunn/seoul256.vim'                                     " Colorscheme
Plug 'bling/vim-airline'                                         " Powerline in Vimscript
Plug 'sheerun/vim-polyglot'                                      " Syntax highlighting for languages
Plug 'scrooloose/syntastic'                                      " Syntax checker
Plug 'tpope/vim-surround'                                        " Quickly surround words with symbols
Plug 'christoomey/vim-tmux-navigator'                            " Doh! That's a Tmux split (no longer!)
Plug 'airblade/vim-gitgutter'                                    " Shows Git diff
Plug 'flazz/vim-colorschemes'                                    " Nice syntax highlighting
Plug 'Lokaltog/vim-easymotion'                                   " Move around better
Plug 'majutsushi/tagbar'                                         " Tags
Plug 'mileszs/ack.vim'                                           " Awk/Ag search
Plug 'chrisbra/vim-diff-enhanced'                                " Smarter diffing
Plug 'blueyed/vim-diminactive'                                   " Dim inactive window (could be very slow)
Plug 'Raimondi/delimitMate'                                      " Autocomplete for punctuation
Plug 'ervandew/supertab'                                         " Tab autocomplete
Plug 'tpope/vim-fugitive'                                        " Git wrapper
Plug 'tpope/vim-sleuth'                                          " Git wrapper
Plug 'ntpeters/vim-better-whitespace'                            " Highlight whitespace
Plug 'AndrewRadev/linediff.vim'                                  " Line diffs
Plug 'mikker/seoul256-iTerm'                                     " Seoul iTerm
Plug 'powerline/fonts'                                           " Powerline fonts (Sauce Code Powerline Regular)
Plug 'tomtom/tcomment_vim'                                       " comment/uncomment
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                                          " FZF plugin for Vim
Plug 'junegunn/goyo.vim'                                         " Page layout
Plug 'junegunn/vim-easy-align'                                   " Aligning columns
Plug 'wincent/command-t'                                         " file navigation
Plug 'junegunn/vim-xmark', { 'do': 'make' }                      " Markdown
Plug 'honza/vim-snippets'                                        " snippets
Plug 'junegunn/rainbow_parentheses.vim'                          " rainbow parentheses
Plug 'wesQ3/vim-windowswap'                                      " swap Vim splits
Plug 'lervag/vimtex', { 'for': 'tex' }                           " LaTeX

                                                                 " == Javascript ==
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }          " Javascript
Plug 'walm/jshint.vim', { 'for': 'javascript' }                  " I can haz good JS style?
Plug 'douglascrockford/JSLint', { 'for': 'javascript' }
Plug 'burnettk/vim-angular', { 'for': 'javascript' }             " Angular
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }             " ReactJS

                                                                 " == HTML ==
Plug 'htacg/tidy-html5', { 'do': 'make install', 'for': 'html' } " HTML5 syntax
Plug 'mattn/emmet-vim', { 'for': 'html' }                        " Expanding HTML abbreviations
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }                     " Pug (Jade) templates
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'html' }               " Jinja2
"
                                                                 " == CSS ==
Plug 'groenewege/vim-less', { 'for': 'less' }                    " syntax highlighting for LESS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }              " Highligh CSS colors
Plug 'wavded/vim-stylus', { 'for': 'styl' }                      " Stylus files

" Initialize plugin system
call plug#end()



" ---------------------------------------------------------------------------
" COLOR SCHEME
" ---------------------------------------------------------------------------
colorscheme seoul256
let g:seoul256_background = 236
colo seoul256

"highlight OverLength      ctermbg=red
highlight ColorColumn     ctermbg=darkgray
highlight ExtraWhitespace ctermbg=red guibg=red



"------------------------------------------------
" Plugin settings
"------------------------------------------------

"" Emmet
let g:user_emmet_leader_key='<C-G>'


"" Airline settings
autocmd User AirlineAfterInit call AirlineInit()
function! AirlineInit()
  " Powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

  " Sections
  let g:airline_inactive_collapse = 1
  let g:airline_section_b = airline#section#create([])
  let g:airline_section_c = airline#section#create(['%{getcwd()}', '/', '%t'])
  let g:airline_section_x = airline#section#create_right([])
  let g:airline_section_y = airline#section#create_right(['%p%%', '%c'])
  let g:airline_section_z = airline#section#create_right(['branch'])
  let g:airline_section_warning = airline#section#create_right(['syntastic'])

  " Tmuxline
  let g:airline#extensions#tmuxline#enabled = 1
endfunction


"" Synstastic settings
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1
let g:syntastic_html_tidy_exec = '~/.vim/bundle/tidy-html5/bin/tidy'
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute', 'trimming empty <']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_loc_list_height = 5
let g:syntastic_python_checkers = ['flake8'] "['pylint', 'flake8']
let g:syntastic_python_flake8_args = '--config ~/.flake8 --ignore=E501,W503'
"let g:syntastic_python_pylint_args = '--rcfile .pylintrc --load-plugins pylint_django --msg-template="{path}:{line}: [{msg_id}] {msg}" -r n'
let g:loaded_syntastic_sh_shellcheck_checker = 1
let g:syntastic_ignore_files = ['tex']
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag()}
highlight link SyntasticError Error
highlight link SyntasticWarning WildMenu


"" Easymotion
nmap <Leader>s <Plug>(easymotion-s2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1


"" Tags
nmap <F8> :TagbarToggle<CR>


"" Awk/Ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif


"" Indent Guide
let g:indent_guides_guide_size = 1

let g:NERDTreeDirArrows = 0


"" Vim Diminactive
let g:diminactive_use_colorcolumn = 0
let g:diminactive_use_syntax = 1


"" Vim Fugitive
set diffopt+=vertical


"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)


" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Tagbar
nnoremap <silent> <Leader>b :TagbarToggle<CR>


" Polyglot
let g:polyglot_disabled = ['latex']


" Vimtex
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_fold_enabled=0
let g:matchup_matchparen_deferred = 1


" FZF
set rtp+=~/.fzf

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] },
  \   <bang>0)
nnoremap ff :GFiles<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right:50%'),
  \   <bang>0)
nnoremap fg :Rg<CR>

autocmd! VimEnter * command! -nargs=* -complete=file Ag :call fzf#vim#ag('', fzf#vim#with_preview('right'))
autocmd! VimEnter * command! -nargs=* -complete=file GFiles :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

