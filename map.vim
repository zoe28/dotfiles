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


" Make Y behave like other capitals
map Y y$"


" Easier visual indent
vnoremap < <gv
vnoremap > >gv


" Pageup/pagedown
noremap gk <C-u>
noremap gj <C-d>


" Scroll bind
command Scb set scrollbind!


" Set filetyps
command Re filetype detect
command Csh set filetype=csh
command Css set filetype=css
command Html set filetype=html
command Js set filetype=javascript
command Less set filetype=less


" paste mode
command Pa set paste!


" Chrome Secure Shell remappings
map <C-e> <C-w>


" Save
nnoremap gs :w<Enter>
nnoremap gss :wq<Enter>
nnoremap gsss :w !sudo tee % >/dev/null<Enter>


" Quit
nnoremap gq  :q<Enter>
nnoremap gqq :q!<Enter>
nnoremap gqa :qa<Enter>


" Split commands.
nnoremap <silent> ss :split  .<Enter>
nnoremap <silent> vv :vsplit .<Enter>

" vertical ➜ horizontal splits
nnoremap <silent> vs <C-w>t<C-w>K

" horizontal ➜ vertical splits
nnoremap <silent> sv <C-w>t<C-w>H

" Resize splits
nnoremap ++ 10<C-w>+
nnoremap -- 10<C-w>-
nnoremap << 5<C-w><
nnoremap >> 5<C-w>>


" File Explorer
nnoremap gx :Explore<Enter>
nnoremap gb :b#<Enter>


" Typos
command Q q
command W w
command Wq wq


" No Exec mode
noremap Q <NOP>


" Space to fold/unfold code
nmap gz za


" Move cursor line to the center of the screen
nnoremap <Enter> zz


" Remove all console.log
nnoremap gc :g/console.log/d<Enter>


" Line comments
nnoremap g> ^i//<C-c>j
nnoremap g< ^:%s/\/\///c<Enter>y


" Line numbers
nmap <F6> :set invnumber<CR>
command No set invnumber! | GitGutterToggle


" Ack
nmap <Leader>/ :Ack<Space>


" unhighlight search
noremap <silent><esc> <esc>:noh<CR><esc>


" replace
nmap ?? :%s/<C-r><C-w>//g<Left><Left>
vmap ?? :s/<C-r><C-w>//g<Left><Left>

nmap ??? :windo %s/<C-r><C-w>//g<Left><Left>


" search tags
nmap \\ :Tags <C-r><C-w>
vmap \\ :Tags <C-r><C-w>


" vimrc
command Vimrc e $MYVIMRC
command Vimre source $MYVIMRC


" Easy reloading of vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" tabs
nnoremap <C-e>g :tab sball<CR>
nnoremap <C-e>t :tab split<CR>
nnoremap <C-e>q :tabclose<CR>
nnoremap <C-e>h :tabp<CR>
nnoremap <C-e>j :tabp<CR>
nnoremap <C-e>k :tabn<CR>
nnoremap <C-e>l :tabn<CR>


" automatically insert a \v before any search string, so search uses normal regexes
nnoremap / /\v
vnoremap / /\v"


" make tab % to jump between brackets.
nnoremap <tab> %
vnoremap <tab> %


" jump back to previous buffer
nnoremap <leader>, <c-^>


" show and select buffer
nnoremap gb :ls<CR>:b<Space>

