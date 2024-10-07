return {
	"dhruvasagar/vim-table-mode",
	event = "BufWinEnter",
	config = function()
		vim.g.table_mode_corner = "|"
	end,
}
