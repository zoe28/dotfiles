" edit vimrc
nnoremap <leader>vrc :vsplit $MYVIMRC<CR>
nnoremap <leader>vab :vsplit ~/.abbrev.vim<CR>
nnoremap <leader>vmp :vsplit ~/.map.vim<CR>
nnoremap <leader>vpg :vsplit ~/.plugs.vim<CR>
nnoremap <silent> <leader>rv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echom 'vimrc reloaded'"<CR>


" reopen last file in split (kinda like cmd-shift-t in Chrome)
nnoremap <C-S-t> :vs<bar>:b#<CR>


" automatically insert a \v before any search string, so search uses normal regexes
nnoremap / /\v
vnoremap / /\v"


" make tab % to jump between brackets.
nnoremap <tab> %
vnoremap <tab> %


" Make Y behave like other capitals
noremap Y y$"


" Easier visual indent
vnoremap < <gv
vnoremap > >gv


" Pageup/pagedown
noremap gk <C-u>
noremap gj <C-d>


" Save
nnoremap gs :w<Enter>
nnoremap gss :wq<Enter>
nnoremap gsss :w !sudo tee % >/dev/null<Enter>


" Quit
nnoremap gq  :q<Enter>
nnoremap gqq :q!<Enter>
nnoremap gqa :qa<Enter>


" Split commands.
nnoremap <silent> ss :Sexplore<Enter>
nnoremap <silent> vv :Vexplore<Enter>

" vertical ➜ horizontal splits
nnoremap <silent> vs :windo wincmd K<Enter>

" horizontal ➜ vertical splits
nnoremap <silent> sv :windo wincmd H<Enter>

" Resize splits
nnoremap ++ 10<C-w>+
nnoremap -- 10<C-w>-
nnoremap << 5<C-w><
nnoremap >> 5<C-w>>
nnoremap <> <C-w>=


" paste mode
command Pa set paste!


" File Explorer
nnoremap gx :Explore<Enter>
nnoremap gb :b#<Enter>


" unhighlight search
noremap <silent><esc> <esc>:noh<CR><esc>


" allow Vim to still understand escape sequences
nnoremap <esc>^[ <esc>^[


" replace
nnoremap ?? :%s/<C-r><C-w>//g<Left><Left>
vnoremap ?? :s/<C-r><C-w>//g<Left><Left>

nnoremap ??? :windo %s/<C-r><C-w>//g<Left><Left>


" yank whole file
nnoremap yyy :%y<CR>


" Move cursor line to the center of the screen
nnoremap <Enter> zz


" make new local file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>n :cd %:p:h<CR>:new 


" Remove all console.log
nnoremap gcl :g/console.log/d<Enter>


" Scroll bind
command Scb set scrollbind!


" Set filetyps
command Re filetype detect
command Csh set filetype=csh
command Css set filetype=css
command Html set filetype=html
command Js set filetype=javascript
command Less set filetype=less


" Chrome Secure Shell remappings
noremap <C-e> <C-w>


" Typos
command Q q
command W w
command Wq wq


" No Exec mode
noremap Q <NOP>


" Space to fold/unfold code
nnoremap gz za


" Line comments
nnoremap g> ^i//<C-c>j
nnoremap g< ^:%s/\/\///c<Enter>y


" Line numbers
nnoremap <F6> :set invnumber<CR>
command No set invnumber! | GitGutterToggle


" Ack
nnoremap <Leader>/ :Ack<Space>


" search tags
nnoremap \\ :Tags <C-r><C-w>
vnoremap \\ :Tags <C-r><C-w>


" vimrc
command Vimrc e $MYVIMRC
command Vimre source $MYVIMRC


" tabs
nnoremap <C-e>g :tab sball<CR>
nnoremap <C-e>t :tab split<CR>
nnoremap <C-e>q :tabclose<CR>
nnoremap <C-e>h :tabp<CR>
nnoremap <C-e>j :tabp<CR>
nnoremap <C-e>k :tabn<CR>
nnoremap <C-e>l :tabn<CR>


" jump back to previous buffer
nnoremap <leader>, <c-^>


" show and select buffer
nnoremap gb :ls<CR>:b<Space>


" unix commands
nnoremap <leader>py :! python %<CR>
nnoremap <leader>py3 :! python %<CR>
nnoremap <leader>nd :! node %<CR>


" Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap v     <C-V>
nnoremap <C-V> v
vnoremap v     <C-V>
vnoremap <C-V> v


" Arrow keys getting in my way
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>


" No manual
noremap <S-k> <NOP>
