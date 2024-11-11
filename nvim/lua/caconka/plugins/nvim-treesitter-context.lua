return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "BufReadPre",
	after = "nvim-treesitter",
	config = function()
		require("treesitter-context").setup {
			separator = "-",
		}

		vim.cmd("hi TreesitterContextBottom gui=NONE")
	end,
}
