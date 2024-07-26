return {
	"akinsho/bufferline.nvim",
	event = "BufWinEnter",
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
