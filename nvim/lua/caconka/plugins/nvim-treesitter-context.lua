return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup {
			separator = "-",
		}

		vim.cmd("hi TreesitterContext guibg=white")
	end,
}
