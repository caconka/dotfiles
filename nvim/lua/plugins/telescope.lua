require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<C-k>"] = "preview_scrolling_up",
				["<C-j>"] = "preview_scrolling_down",
			}
		},
		preview = {
			treesitter = false
		},
	},
	pickers = {
		find_files = {
			layout_config = {prompt_position = "top"}
		},
		live_grep = {
			layout_config = {prompt_position = "top"}
		},
		buffers = {
			layout_config = {prompt_position = "top"}
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
