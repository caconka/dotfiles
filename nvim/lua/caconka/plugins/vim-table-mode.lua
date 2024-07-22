return {
	"dhruvasagar/vim-table-mode",
	event = "BufRead",
	config = function()
		vim.g.table_mode_corner = "|"
	end,
}
