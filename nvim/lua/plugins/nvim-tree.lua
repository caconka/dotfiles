require("nvim-tree").setup()

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", { silent = true })
