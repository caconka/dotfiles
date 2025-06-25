if vim.loader then
	vim.loader.enable()
end

vim.g.mapleader = " "

require("caconka.lazy")
require("caconka.config.theme")
require("caconka.config.options")
require("caconka.config.mappings")
require("caconka.config.functions")

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*",
	callback = function()
		vim.schedule(function()
			if vim.bo.filetype == "" then
				vim.cmd("filetype detect")
			end
		end)
	end
})

vim.api.nvim_create_autocmd("FocusLost", {
	pattern = "*",
	desc = "Save all files when focus is lost",
	callback = function()
		vim.cmd("silent! wa")
	end,
})
