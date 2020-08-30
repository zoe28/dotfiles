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
