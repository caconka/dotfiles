require'nvim-tree'.setup {
  view = {
    width = 45
  }
}

vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>tf", ":NvimTreeFindFile<CR>", {noremap=true})
