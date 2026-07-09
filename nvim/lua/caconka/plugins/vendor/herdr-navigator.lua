local function nav(wincmd, dir)
	local prev = vim.api.nvim_get_current_win()
	vim.cmd("wincmd " .. wincmd)
	if vim.api.nvim_get_current_win() ~= prev then
		return -- moved within Neovim
	end
	-- At a split edge: cross into the surrounding multiplexer.
	if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= "" then
		local herdr = vim.env.HERDR_BIN_PATH
		if herdr == nil or herdr == "" then
			herdr = "herdr"
		end
		vim.fn.system({ herdr, "pane", "focus", "--direction", dir, "--current" })
	elseif vim.env.TMUX and vim.env.TMUX ~= "" then
		local tmux_flag = { left = "-L", down = "-D", up = "-U", right = "-R" }
		vim.fn.system({ "tmux", "select-pane", tmux_flag[dir] })
	end
end

local function map(lhs, wincmd, dir, desc)
	vim.keymap.set("n", lhs, function()
		nav(wincmd, dir)
	end, { silent = true, noremap = true, desc = desc })
end

map("<M-h>", "h", "left", "Navigate left (vim/herdr)")
map("<M-j>", "j", "down", "Navigate down (vim/herdr)")
map("<M-k>", "k", "up", "Navigate up (vim/herdr)")
map("<M-l>", "l", "right", "Navigate right (vim/herdr)")
