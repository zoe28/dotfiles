" ----------------------------------------------------------------------------
" Ale
" ----------------------------------------------------------------------------
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

