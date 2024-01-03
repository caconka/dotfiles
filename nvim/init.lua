if vim.loader then
	vim.loader.enable()
end

vim.g.mapleader = " "

---
-- Configs
---
require("caconka.config.options")
require("caconka.config.mappings")
require("caconka.config.functions")

---
-- Plugins
---
require("plugins.lazy").setup({
	-- Theming
	{"mcchrish/zenbones.nvim"},
	{"rktjmp/lush.nvim"},
	{"nvim-lualine/lualine.nvim"},
	{"akinsho/bufferline.nvim"},
	{"kyazdani42/nvim-tree.lua"},

	-- Fuzzy finder
	{"nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { {"nvim-lua/plenary.nvim"} }},
	{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},


	-- Code manipulation
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, -- In Fedora install "gcc-c++" package
	{"numToStr/Comment.nvim"},
	{"tpope/vim-surround"},
	{"windwp/nvim-autopairs"},
	{"iamcco/markdown-preview.nvim", ft = "markdown", build = ":call mkdp#util#install()"},

	-- Utilities
	{"nvim-lua/plenary.nvim"},
	{"nvim-neorg/neorg", build = ":Neorg sync-parsers", dependencies = { "nvim-lua/plenary.nvim" }},
	{"FabijanZulj/blame.nvim"},

	-- LSP support
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},

	-- Lint
	{"mfussenegger/nvim-lint"},

	-- Autocomplete
	{"hrsh7th/nvim-cmp"},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"hrsh7th/cmp-cmdline"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"saadparwaiz1/cmp_luasnip"},

	-- Snippets
	{"L3MON4D3/LuaSnip"},
	{"rafamadriz/friendly-snippets"},
})

---
-- Plugins setups
---
require("plugins.zenbones")
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.nvim-treesitter")
require("Comment").setup({})
require("nvim-autopairs").setup({})
require("plugins.neorg")
require("plugins.lsp")
require("plugins.nvim-lint")
require("plugins.cmp")
