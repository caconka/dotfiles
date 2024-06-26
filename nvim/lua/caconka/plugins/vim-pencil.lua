return {
	"preservim/vim-pencil",
	config = function()
		local group = vim.api.nvim_create_augroup("pencil", {clear = true})

		vim.g["pencil#textwidth"] = 90
		vim.g["pencil#conceallevel"] = 2
		vim.g["pencil#concealcursor"] = "n"

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.md", "*.txt", "*.norg" },
			command = "PencilHard | set textwidth=90 | set colorcolumn=0",
			group = group
		})

		vim.api.nvim_create_autocmd("BufLeave", {
			pattern = { "*.md", "*.txt", "*.norg" },
			command = "PencilOff | set textwidth=0 | set colorcolumn=+1",
			group = group
		})
	end,
}
