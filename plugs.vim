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
Plug 'flazz/vim-colorschemes'                                                               " Nice syntax highlighting
Plug 'honza/vim-snippets'                                                                   " Snippets
Plug 'junegunn/fzf.vim'                                                                     " FZF plugin for Vim
Plug 'junegunn/rainbow_parentheses.vim'                                                     " Rainbow parentheses
Plug 'junegunn/seoul256.vim'                                                                " Colorscheme
Plug 'junegunn/vim-easy-align'                                                              " Aligning columns
Plug 'junegunn/vim-xmark', { 'do': 'make' }                                                 " Markdown
Plug 'lervag/vimtex', { 'for': 'tex' }                                                      " LaTeX
Plug 'ludovicchabant/vim-gutentags'                                                         " Manage tags
Plug 'MattesGroeger/vim-bookmarks'                                                          " Bookmarks
Plug 'mattn/gist-vim'                                                                       " Create gists
Plug 'mikker/seoul256-iTerm'                                                                " Seoul iTerm
Plug 'mileszs/ack.vim'                                                                      " Awk/Ag search
Plug 'mhinz/vim-startify'                                                                   " Start screen
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                             " Autocomplete
Plug 'ntpeters/vim-better-whitespace'                                                       " Highlight whitespace
Plug 'powerline/fonts'                                                                      " Powerline fonts (Sauce Code Powerline Regular)
Plug 'sheerun/vim-polyglot'                                                                 " Syntax highlighting for languages
Plug 'tomtom/tcomment_vim'                                                                  " Comment/uncomment
Plug 'tpope/vim-fugitive'                                                                   " Git wrapper
Plug 'tpope/vim-rhubarb'                                                                    " Gbrowse with hub
Plug 'tpope/vim-sleuth'                                                                     " Git wrapper
Plug 'tpope/vim-surround'                                                                   " Quickly surround words with symbols
Plug 'tweekmonster/startuptime.vim'                                                         " Vim profiler
Plug 'w0rp/ale'                                                                             " Async lint engine
Plug 'wesQ3/vim-windowswap'                                                                 " Swap Vim splits

                                                                                            " == Javascript ==
Plug 'douglascrockford/JSLint', { 'for': 'javascript' }                                     " linting
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }                       " Flow type checking
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }                " React
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }                                     " Vim & Javascript

                                                                                            " == GraphQL ==
Plug 'jparise/vim-graphql'                                                                  " GraphQL

                                                                                            " == HTML ==
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'html' }                                          " Jinja2
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }                                                " Pug (Jade) templates
Plug 'htacg/tidy-html5', { 'do': 'make install', 'for': 'html' }                            " HTML5 syntax
Plug 'mattn/emmet-vim', { 'for': 'html' }                                                   " Expanding HTML abbreviations
Plug 'mustache/vim-mustache-handlebars', { 'for': 'handlebars' }                            " Mustache, Handlebars

                                                                                            " == CSS ==
Plug 'alampros/vim-styled-jsx', { 'for': ['javascript', 'javascript.jsx'] }                 " Highlight CSS colors
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'javascript', 'javascript.jsx', 'less'] } " Highlight CSS colors
Plug 'groenewege/vim-less', { 'for': 'less' }                                               " syntax highlighting for LESS
Plug 'wavded/vim-stylus', { 'for': 'styl' }                                                 " Stylus files

                                                                                            " == Ruby ==
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }                                                 " Vim & Ruby
Plug 'zackhsi/sorbet-lsp', { 'for': 'ruby' }                                                " Sorbet

                                                                                            " == Go ==
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }                                          " Go language support


" Initialize plugin system
call plug#end()



" ---------------------------------------------------------------------------
" Plugin configs
" ---------------------------------------------------------------------------
source ~/.airline.vim
source ~/.ale.vim
source ~/.coc.vim
source ~/.easymotion.vim
source ~/.fzf.vim
source ~/.tags.vim



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
" Miscellaneous
" ----------------------------------------------------------------------------

"" indent guide
let g:indent_guides_guide_size = 1

let g:NERDTreeDirArrows = 0


"" vim diminactive
let g:diminactive_use_colorcolumn = 0
let g:diminactive_use_syntax = 1


"" vim fugitive
set diffopt+=vertical
let g:github_enterprise_urls = ['https://git.corp.stripe.com']  " for vim-rhubarb


"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
nnoremap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)


"" polyglot
let g:polyglot_disabled = ['latex']


" vimtex
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_fold_enabled=0
let g:matchup_matchparen_deferred = 1


"" emmet
let g:user_emmet_leader_key='<C-G>'


"" sorbet
if fnamemodify(getcwd(), ':p') == $HOME.'/stripe/pay-server/'
  let g:ale_linters = {'ruby': ['sorbet-lsp']}
end
" Bind <leader>d to go-to-definition.
nnoremap <silent> <leader>d <Plug>(ale_go_to_definition)


"" flow
let g:javascript_plugin_flow = 1


"" startify
nnoremap <leader>c :SClose<CR>
