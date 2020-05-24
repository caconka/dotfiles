let g:ale_completion_enabled = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '•'
let g:ale_set_highlights = 0
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'json': ['prettier'],
	\ 'javascript': ['prettier', 'eslint'],
	\ 'vue': ['eslint'],
	\ 'css': ['prettier']
	\}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

nmap <silent> <F3> <Plug>(ale_previous_wrap)
nmap <silent> <F4> <Plug>(ale_next_wrap)
nmap <silent> <F8> <Plug>(ale_fix)
