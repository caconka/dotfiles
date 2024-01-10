require("nvim-tree").setup({
	view = {
		width = 50,
		preserve_window_proportions = true,
	},
	renderer = {
		group_empty = true,
	},
})

vim.keymap.set("n", "<Leader>tt", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<Leader>tf", ":NvimTreeFindFile<CR>", { silent = true })
