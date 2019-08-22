" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------

" Install new plugins
nnoremap <leader>pi :source $MYVIMRC<CR>:PlugInstall<CR>

" Configuration
if has("win32")
  let g:vim_home_path = "~/vimfiles"
else
  let g:vim_home_path = "~/.vim"
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

                                                                                            " == General ==
Plug 'airblade/vim-rooter'                                                                  " Project root dir
Plug 'AndrewRadev/linediff.vim'                                                             " Line diffs
Plug 'Lokaltog/vim-easymotion'                                                              " Move around better
Plug 'Raimondi/delimitMate'                                                                 " Autocomplete for punctuation
Plug 'airblade/vim-gitgutter'                                                               " Shows Git diff
Plug 'bling/vim-airline'                                                                    " Powerline in Vimscript
Plug 'blueyed/vim-diminactive'                                                              " Dim inactive window (could be very slow)
Plug 'chrisbra/vim-diff-enhanced'                                                           " Smarter diffing
Plug 'christoomey/vim-tmux-navigator'                                                       " Doh! That's a Tmux split (no longer!)
Plug 'ervandew/supertab'                                                                    " Tab autocomplete
Plug 'flazz/vim-colorschemes'                                                               " Nice syntax highlighting
Plug 'honza/vim-snippets'                                                                   " Snippets
Plug 'junegunn/fzf.vim'                                                                     " FZF plugin for Vim
Plug 'junegunn/goyo.vim'                                                                    " Page layout
Plug 'junegunn/rainbow_parentheses.vim'                                                     " Rainbow parentheses
Plug 'junegunn/seoul256.vim'                                                                " Colorscheme
Plug 'junegunn/vim-easy-align'                                                              " Aligning columns
Plug 'junegunn/vim-xmark', { 'do': 'make' }                                                 " Markdown
Plug 'lervag/vimtex', { 'for': 'tex' }                                                      " LaTeX
Plug 'ludovicchabant/vim-gutentags'                                                         " Manage tags
Plug 'majutsushi/tagbar'                                                                    " Tags
Plug 'mikker/seoul256-iTerm'                                                                " Seoul iTerm
Plug 'mileszs/ack.vim'                                                                      " Awk/Ag search
Plug 'ntpeters/vim-better-whitespace'                                                       " Highlight whitespace
Plug 'powerline/fonts'                                                                      " Powerline fonts (Sauce Code Powerline Regular)
Plug 'sbdchd/neoformat'                                                                     " Auto formatter
" Plug 'scrooloose/nerdtree'                                                                " File explorer
Plug 'scrooloose/syntastic'                                                                 " Syntax checker
Plug 'sheerun/vim-polyglot'                                                                 " Syntax highlighting for languages
Plug 'tomtom/tcomment_vim'                                                                  " Comment/uncomment
Plug 'tpope/vim-fugitive'                                                                   " Git wrapper
Plug 'tpope/vim-rhubarb'                                                                    " Gbrowse with hub
Plug 'tpope/vim-sleuth'                                                                     " Git wrapper
Plug 'tpope/vim-surround'                                                                   " Quickly surround words with symbols
Plug 'tpope/vim-unimpaired'                                                                 " Complementary pairs of mappings
Plug 'w0rp/ale'                                                                             " Async lint engine
Plug 'wesQ3/vim-windowswap'                                                                 " Swap Vim splits
Plug 'wincent/command-t'                                                                    " File navigation

                                                                                            " == Javascript ==
Plug 'burnettk/vim-angular', { 'for': 'javascript' }                                        " Angular
Plug 'douglascrockford/JSLint', { 'for': 'javascript' }                                     " linting
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }                       " Flow type checking
Plug 'galooshi/vim-import-js', { 'for': ['javascript', 'javascript.jsx'] }                  " Easier imports
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }                " React
" Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] } " React
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }                                     " Vim & Javascript
Plug 'walm/jshint.vim', { 'for': 'javascript' }                                             " I can haz good JS style?

                                                                                            " == GraphQL ==
Plug 'jparise/vim-graphql'                                                                  " GraphQL

                                                                                            " == HTML ==
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'html' }                                          " Jinja2
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }                                                " Pug (Jade) templates
Plug 'htacg/tidy-html5', { 'do': 'make install', 'for': 'html' }                            " HTML5 syntax
Plug 'mattn/emmet-vim', { 'for': 'html' }                                                   " Expanding HTML abbreviations
Plug 'mustache/vim-mustache-handlebars', { 'for': 'handlebars' }                            " Mustache, Handlebars

                                                                                            " == CSS ==
Plug 'alampros/vim-styled-jsx', { 'for': ['javascript', 'javascript.jsx'] }                 " styled-jsx
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'javascript', 'javascript.jsx', 'less'] } " Highlight CSS colors
Plug 'groenewege/vim-less', { 'for': 'less' }                                               " syntax highlighting for LESS
Plug 'wavded/vim-stylus', { 'for': 'styl' }                                                 " Stylus files

                                                                                            " == Ruby ==
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }                                                 " Vim & Ruby
Plug 'zackhsi/sorbet-lsp', { 'for': 'ruby' }                                                " Sorbet

" Initialize plugin system
call plug#end()



" ---------------------------------------------------------------------------
" Color scheme
" ---------------------------------------------------------------------------
colorscheme seoul256
let g:seoul256_background = 236
colo seoul256

"highlight OverLength      ctermbg=red
highlight ColorColumn     ctermbg=darkgray
highlight ExtraWhitespace ctermbg=red guibg=red



" ----------------------------------------------------------------------------
" Powerline
" ----------------------------------------------------------------------------

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
  let g:airline_section_c = airline#section#create(['%F'])
  let g:airline_section_x = airline#section#create_right([])
  let g:airline_section_y = airline#section#create_right(['%p%%', '%c'])
  let g:airline_section_z = airline#section#create_right(['branch'])
  let g:airline_section_warning = airline#section#create_right(['syntastic'])

  " Tmuxline
  let g:airline#extensions#tmuxline#enabled = 1
endfunction



" ----------------------------------------------------------------------------
" fzf
" ----------------------------------------------------------------------------

set rtp+=~/.fzf

autocmd! VimEnter * command! -nargs=* -complete=file GFiles :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))
nnoremap ff :GFiles<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('right:50%'),
  \   <bang>0)
nnoremap fg :Rg<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

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


" search files
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>F :Files<CR>

" search buffer
nnoremap <Leader>b :Buffers<CR>
" nnoremap <Leader>h :History<CR>

" saerch tags
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

" search lines
nnoremap <Leader>' :Marks<CR>'

" grep in project
nnoremap <Leader>a :Ag<Space>

" search Vim docs
nnoremap <Leader>H :Helptags!<CR>

" search Vim commands
nnoremap <Leader>C :Commands<CR>

" search key mappings
nnoremap <Leader>M :Maps<CR>



" ----------------------------------------------------------------------------
" Awk/Ag
" ----------------------------------------------------------------------------

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



" ----------------------------------------------------------------------------
" Syntastic
" ----------------------------------------------------------------------------

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

nnoremap <Leader>ne :lnext<CR>
nnoremap <Leader>Ne :lprevious<CR>



" ----------------------------------------------------------------------------
" Easymotion
" ----------------------------------------------------------------------------

nnoremap <Leader>s <Plug>(easymotion-s2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1



" ----------------------------------------------------------------------------
" Tags
" ----------------------------------------------------------------------------

"" Gutentag
set statusline+=%{gutentags#statusline()}

" Tagbar
nnoremap <silent> fb :TagbarToggle<CR>



" ----------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------

let NERDTreeCascadeOpenSingleChildDir=0
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <Leader>= :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
" open a NERDTree automatically when vim starts up if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" ----------------------------------------------------------------------------
" Miscellaneous
" ----------------------------------------------------------------------------

"" Indent Guide
let g:indent_guides_guide_size = 1

let g:NERDTreeDirArrows = 0


"" Vim Diminactive
let g:diminactive_use_colorcolumn = 0
let g:diminactive_use_syntax = 1


"" Vim Fugitive
set diffopt+=vertical
let g:github_enterprise_urls = ['https://git.corp.stripe.com']  " for vim-rhubarb


"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)


" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)


"" Polyglot
let g:polyglot_disabled = ['latex']


" Vimtex
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_fold_enabled=0
let g:matchup_matchparen_deferred = 1


"" Ale
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'css': ['prettier'],
  \ 'markdown': ['prettier'],
\ }

" Be sure to never install 'prettier' globally, or you will be running
let g:ale_javascript_prettier_use_local_config = 1

augroup aleMaps
  au FileType javascript let g:ale_fix_on_save = 1
  au FileType css let g:ale_fix_on_save = 1
  au FileType markdown let g:ale_fix_on_save = 1
augroup END


"" Emmet
let g:user_emmet_leader_key='<C-G>'


"" Sorbet
if fnamemodify(getcwd(), ':p') == $HOME.'/stripe/pay-server/'
  let g:ale_linters = {'ruby': ['sorbet-lsp']}
end
" Bind <leader>d to go-to-definition.
nnoremap <silent> <leader>d <Plug>(ale_go_to_definition)


"" Flow
let g:javascript_plugin_flow = 1


"" Neoformat
" autocmd BufWritePre *.js Neoformat
