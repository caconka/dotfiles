return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map('n', '<leader>tb', gs.toggle_current_line_blame)
				map('n', '<leader>gd', gs.diffthis)
				map('n', '<leader>td', gs.toggle_deleted)
			end,
		})
	end,
}
