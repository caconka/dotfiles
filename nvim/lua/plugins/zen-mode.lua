vim.keymap.set({"n", "v"}, "<Leader>z", ":ZenMode<CR>", { silent = true })

local opts = {
	window = {
		backdrop = 1,
		width = 0.97,
		height = 0.94,
		options = {
			relativenumber = false,
			number = false,
			signcolumn = "no",
			cursorline = false,
			cursorcolumn = false,
			colorcolumn = "",
			list = false
		}
	}
}

return opts
