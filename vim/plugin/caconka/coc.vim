" let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-go',
" 	\ 'coc-java', 'coc-yaml', 'coc-tsserver', 'coc-python', 'coc-pairs', 'coc-explorer']
"
" " Better display for messages
" set cmdheight=2
" " Smaller updatetime for CursorHold & CursorHoldI
" set updatetime=300
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
"
" " Use K for show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" " Make <CR> (Enter) to accept selected completion item or notify coc.nvim to format
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gt <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" xmap <leader>=  <Plug>(coc-format-selected)
" nmap <leader>=  <Plug>(coc-format-selected)
"
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
"
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
"
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " plugin settings
" let b:coc_pairs_disabled = ['<']
"
" " coc-explorer
" :nmap <leader>tt <Cmd>CocCommand explorer<CR>
" :nmap <leader>tf <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR><C-w>h
