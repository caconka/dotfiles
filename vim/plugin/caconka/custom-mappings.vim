" Buffers
map <C-l> :bnext<CR>
map <C-h> :bprev<CR>
map <leader>d :bd<CR>
map <leader>ad :%bd<CR>

" Tabs
vmap <Tab> >gv
vmap <S-Tab> <gv

" Move lines vertically
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Toggle numbers
nnoremap <leader>n :set number! relativenumber! <CR>

" Toggle conceallevel
nnoremap <leader>c :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>

" Paste clipboard
let os=substitute(system('uname'), '\n', '', '')
if os == 'Linux'
	nnoremap <C-R>+ :r !xclip -selection clipboard -o<CR>
else
	nnoremap <C-R>+ :r !pbpaste<CR>
	noremap! <C-?> <C-h>
endif
