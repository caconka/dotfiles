vim.opt.showmode = false

require("lualine").setup({
	options = {
		component_separators = "|",
		section_separators = "",
		disabled_filetypes = {
			statusline = {"NvimTree"},
		},
	},
})
