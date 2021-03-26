let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1
let g:ale_set_highlights = 1
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 1
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'json': ['prettier'],
	\ 'javascript': ['prettier', 'eslint'],
	\ 'vue': ['eslint'],
	\ 'css': ['prettier'],
	\ 'go': ['goimports']
\}

let g:ale_sign_error = ' ✖'
let g:ale_sign_warning = ' •'

let g:ale_echo_msg_error_str = 'ERROR'
let g:ale_echo_msg_warning_str = 'WARNING'
let g:ale_echo_msg_format = '[%linter%] %severity% - %s'

"Loc List
nmap <leader>e :lopen<CR>
nmap <leader>w :lclose<CR>

nmap <silent> gp <Plug>(ale_previous_wrap)
nmap <silent> gn <Plug>(ale_next_wrap)
nmap <silent> <F8> <Plug>(ale_fix)
