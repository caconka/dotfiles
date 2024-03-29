" " disable statusbar
" autocmd! FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"
" " layout enable window functionality
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"
" " use fd instead find
" let $FZF_DEFAULT_COMMAND='fd --hidden --type f --exclude .git --exclude target'
" let $FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
" let $FZF_DEFAULT_OPTS="--layout=reverse --preview 'bat --decorations=never --line-range :300 {}' --preview-window=noborder
"   \ --color=fg:#383a42,bg:#fafafa,hl:#383a42
"   \ --color=fg+:#383a42,bg+:#fafafa,hl+:#c18401
"   \ --color=info:#383a42,prompt:#383a42,pointer:#383a42
"   \ --color=marker:#383a42,spinner:#383a42,header:#383a42"
"
" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always
"     \ --colors="line:fg:237" --colors="path:fg:237" --colors="match:fg:136"
"     \ --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction
"
" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"
" nnoremap <leader>f :RG<CR>
"
" nmap <C-p> :Files<CR>
" nmap <leader>p :GFiles<CR>
" nmap <leader>b :Buffers<CR>
" nmap <leader>h :History<CR>
" nmap <leader>l :BLines<CR>
" nmap <leader>L :Lines<CR>
"
" imap <c-x><c-f> <plug>(fzf-complete-file)
