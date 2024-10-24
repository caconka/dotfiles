return {
	"kyazdani42/nvim-tree.lua",
	event = "VimEnter",
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 50,
				preserve_window_proportions = true,
			},
			renderer = {
				group_empty = true,
			},
		})

		vim.keymap.set("n", "<Leader>tt", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
		vim.keymap.set("n", "<Leader>tf", ":NvimTreeFindFile<CR>", { silent = true, noremap = true })
	end,
}
