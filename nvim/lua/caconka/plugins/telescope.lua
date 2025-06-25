return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	requires = { {"nvim-lua/plenary.nvim"} },
	dependencies = { "nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"} },
	-- event = "BufWinEnter",
	event = "VeryLazy",
	cmd = "Telescope",
	keys = {
		{ "<Leader>?", ":Telescope oldfiles<cr>" },
		{ "<Leader>b", ":Telescope buffers<cr>" },
		{ "<C-p>", ":Telescope find_files<cr>" },
		{ "<Leader>f", ":Telescope live_grep<cr>" },
		{ "<Leader>d", ":Telescope diagnostics<cr>" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top"
					}
				},
				mappings = {
					i = {
						["<C-k>"] = "preview_scrolling_up",
						["<C-j>"] = "preview_scrolling_down",
					}
				},
				preview = {
					treesitter = false
				},
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
			},
			pickers = {
				find_files = {
					previewer = false
				},
			},
			extensions = {
				fzf = {}
			}
		})
	end
}
