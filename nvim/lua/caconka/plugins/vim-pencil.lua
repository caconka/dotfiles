return {
	"preservim/vim-pencil",
	event = "InsertEnter",
	config = function()
		local group = vim.api.nvim_create_augroup("pencil", {clear = true})

		vim.g["pencil#textwidth"] = 90
		vim.g["pencil#conceallevel"] = 2
		vim.g["pencil#concealcursor"] = "n"

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.md" },
			command = "PencilHard | set textwidth=90",
			group = group
		})

		vim.api.nvim_create_autocmd("BufLeave", {
			pattern = { "*.md" },
			command = "PencilOff | set textwidth=0",
			group = group
		})
	end,
}
