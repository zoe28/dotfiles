" Autoequalize splits
autocmd VimResized * wincmd =



" Automagically save files when focus is lost, but ignore any warnings, e.g.
" when a buffer doesn't have an associated file
autocmd BufLeave,FocusLost silent! wall



" Jump to last cursor position unless it's invalid or in an event handler when reopening a file/vim
" Inspired by Gary Bernhardt/Destroy All Software
augroup vimrcEx
  autocmd!

  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set autoindent shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType python set shiftwidth=4 softtabstop=4 expandtab
augroup END



" Spell check README's
autocmd BufRead,BufNewFile *.md setlocal spell
highlight SpellBad term=reverse ctermfg=252 ctermbg=52 guifg=#D9D9D9 guibg=#730B00



" Large file - file is larger than 10MB
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
  " no syntax highlighting etc
  set eventignore+=FileType
  " save memory when other file is viewed
  setlocal bufhidden=unload
  " is read-only (write with :w new_filename)
  setlocal buftype=nowrite
  " no undo possible
  setlocal undolevels=-1
  " display message
  autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction



" LaTeX
au FileType tex setlocal nocursorline
au FileType tex set nofoldenable
au FileType tex :NoMatchParen
au FileType tex :syn clear texAccent
au FileType tex :syn clear texLength
au FileType tex :syn clear texOnlyMath
au FileType tex :syn clear texOption
au FileType tex :syn clear texSectionZone
au FileType tex :syn clear texStatement
au FileType tex :syn clear texString
au FileType tex :syn clear texSubSectionZone
