return {
	"akinsho/bufferline.nvim",
	event = "BufWinEnter",
	after = "catppuccin",
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
      -- highlights = require("catppuccin.groups.integrations.bufferline").get()
		})
	end,
}
