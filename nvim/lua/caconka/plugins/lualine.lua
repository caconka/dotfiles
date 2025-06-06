vim.opt.showmode = false

return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = "|",
				section_separators = "",
				disabled_filetypes = {
					statusline = {"NvimTree"},
				},
			},
			sections = {
				lualine_c = {
					{
						'filename',
						path = 1, -- Show relative path
					}
				},
			}
		})
	end,
}
