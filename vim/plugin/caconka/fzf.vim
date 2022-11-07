" disable statusbar
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" layout enable window functionality
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
" bg color
" let g:fzf_colors = { "bg+": ["bg", "CursorLine", "CursorColumn"] }
" use fd instead find
let $FZF_DEFAULT_COMMAND='fd --hidden --type f --exclude .git'
let $FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
let $FZF_DEFAULT_OPTS='--layout=reverse'

nmap <C-p> :Files<CR>
nmap <leader>p :GFiles<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>
nmap <leader>l :BLines<CR>
nmap <leader>L :Lines<CR>

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

nnoremap <leader>f :GGrep<CR>

imap <c-x><c-f> <plug>(fzf-complete-file)

let g:fzf_colors =
\ { 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Comment'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Statement'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'Ignore'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Exception'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Label'],
  \ 'header':     ['fg', 'Comment'] }
