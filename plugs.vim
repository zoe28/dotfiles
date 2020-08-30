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
" Plug 'ervandew/supertab'                                                                    " Tab autocomplete
Plug 'flazz/vim-colorschemes'                                                               " Nice syntax highlighting
" Plug 'francoiscabrol/ranger.vim'                                                            " directory explorer
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
" Plug 'majutsushi/tagbar'                                                                    " Tags
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
" Plug 'wincent/command-t'                                                                    " File navigation

                                                                                            " == Javascript ==
Plug 'douglascrockford/JSLint', { 'for': 'javascript' }                                     " linting
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }                       " Flow type checking
" Plug 'galooshi/vim-import-js', { 'for': ['javascript', 'javascript.jsx'] }                  " Easier imports
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

" Plug 'ryanoasis/vim-devicons'                                                               " file type icons (must be last)

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
  " Extensions
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#gutentags#enabled = 1
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline#extensions#tmuxline#enabled = 1

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
  let g:airline_skip_empty_sections = 1
  let g:airline_section_b = airline#section#create([])
  let g:airline_section_c = airline#section#create(['%F'])
  let g:airline_section_x = airline#section#create_right([])
  let g:airline_section_y = airline#section#create_right(['%p%%', '%c'])
  let g:airline_section_z = airline#section#create_right(['tagbar'])
  " let g:airline_section_z = airline#section#create_right(['branch'])
  let g:airline_section_error = airline#section#create_right(['ale'])
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
" Easymotion
" ----------------------------------------------------------------------------

map <Leader>s <Plug>(easymotion-s2)
map <Leader>t <Plug>(easymotion-t2)

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

"" GutenTags
set statusline+=%{gutentags#statusline()}
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
	\ '--tag-relative=yes',
	\ '--fields=+ailmnS',
	\ ]

" Tagbar
nnoremap <silent> fb :TagbarToggle<CR>



" ----------------------------------------------------------------------------
" coc.vim
" ----------------------------------------------------------------------------

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



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


"" ale
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'css': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'ruby': ['prettier'],
\ }

let g:ale_go_gometalinter_options = '--aggregate --disable-all --enable=golint --enable=goimports --enable=gosec --enable=ineffassign --enable=structcheck --enable=vet --sort=line -t --vendor --vendored-linters'
let g:ale_javascript_prettier_use_local_config = 1 " Be sure to never install 'prettier' globally, or you will be running
let g:ale_lint_on_enter = 0 " don't lint on enter
let g:ale_lint_on_insert_leave = 0 " don't lint when leaving insert mode
let g:ale_lint_on_text_changed = 'never' " lint only on save
let g:ale_linters_explicit = 1
let g:ale_ruby_rubocop_executable = 'bundle'
" let g:ale_ruby_rubocop_executable = '.binstubs/rubocop'
let g:ale_set_highlights = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠ '

call ale#linter#Define('ruby', {
  \ 'name': 'sorbet-payserver',
  \ 'lsp': 'stdio',
  \ 'executable': 'true',
  \ 'command': 'pay exec scripts/bin/typecheck --lsp',
  \ 'language': 'ruby',
  \ 'project_root': $HOME . '/stripe/pay-server',
\ })

if !exists("g:ale_linters")
  let g:ale_linters = {}
endif

augroup aleMaps
  au FileType javascript let g:ale_fix_on_save = 1
  au FileType css let g:ale_fix_on_save = 1
  au FileType markdown let g:ale_fix_on_save = 1
  au FileType ruby let g:ale_fix_on_save = 1
augroup END


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
