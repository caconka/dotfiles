let g:nvim_tree_indent_markers = 1

:lua require('nvim-tree').setup()

nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>
