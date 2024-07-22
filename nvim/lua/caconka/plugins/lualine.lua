vim.opt.showmode = false

return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "|",
				section_separators = "",
				disabled_filetypes = {
					statusline = {"NvimTree"},
				},
			},
		})
	end,
}
