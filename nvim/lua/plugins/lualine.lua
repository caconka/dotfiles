vim.opt.showmode = false

require("lualine").setup({
	options = {
		theme = "zenwritten",
		component_separators = "|",
		section_separators = "",
    disabled_filetypes = {
      statusline = {"NvimTree"},
    },
	},
})
