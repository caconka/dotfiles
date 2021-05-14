" disable statusbar
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" layout enable window functionality
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
" bg color
let g:fzf_colors =
\ { "bg+": ["bg", "CursorLine", "CursorColumn"] }
" use fd instead find
let $FZF_DEFAULT_COMMAND='fd --hidden --type f --exclude .git'
let $FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
let $FZF_DEFAULT_OPTS='--layout=reverse'

nmap <C-p> :Files<CR>
nmap <Leader>p :GFiles<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>

nnoremap <leader>f :Rg<CR>

imap <c-x><c-f> <plug>(fzf-complete-file)
