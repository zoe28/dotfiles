" ----------------------------------------------------------------------------
" Airline
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
