return {
	{ "godlygeek/tabular", event = "BufRead" },
	{ "tpope/vim-fugitive", event = "BufRead" },
	{ "tpope/vim-surround", event = "BufRead" },
	"nvim-lua/plenary.nvim",

	{"L3MON4D3/LuaSnip", event = "InsertCharPre", dependencies = { "rafamadriz/friendly-snippets" }},
}
