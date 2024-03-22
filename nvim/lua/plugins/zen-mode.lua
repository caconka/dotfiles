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
		},
	},
	plugins = {
		-- disable some global vim options (vim.o...)
		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
			showcmd = false, -- disables the command in the last line of the screen
			-- you may turn on/off statusline in zen mode by setting 'laststatus'
			-- statusline will be shown only if 'laststatus' == 3
			laststatus = 0, -- turn off the statusline in zen mode
		},
		tmux = { enabled = true }, -- disables the tmux statusline
	},
}

return opts
