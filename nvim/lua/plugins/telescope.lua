require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = "preview_scrolling_up",
				["<C-j>"] = "preview_scrolling_down",
			}
		},
		preview = {
			treesitter = false
		}
	},
	pickers = {
    find_files = {
			theme = "ivy"
    }
  },
  extensions = {
    fzf = {}
  }
})

vim.keymap.set("n", "<leader>?", ":Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>")
vim.keymap.set("n", "<C-p>", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<cr>")
