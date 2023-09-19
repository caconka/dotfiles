require("nvim-tree").setup({
	view = {
		width = 30,
		preserve_window_proportions = true,
	},
	renderer = {
		group_empty = true,
	},
})

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", { silent = true })
