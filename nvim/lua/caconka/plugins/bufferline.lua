return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				buffer_close_icon = "",
				close_icon = "",
				offsets = {
					{filetype = "NvimTree"}
				},
			},
			highlights = {
				fill = {
					fg = "#000000",
					bg = "#ffffff",
				},
				-- buffer = {
				-- 	fg = "#000000",
				-- 	bg = "#dce0e8",
				-- },
				buffer_selected = {
					italic = false,
				},
				indicator_selected = {
					italic = false,
				}
			}
		})
	end,
}
