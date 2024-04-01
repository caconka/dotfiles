if vim.loader then
	vim.loader.enable()
end

vim.g.mapleader = " "

require("caconka.config.options")
require("caconka.config.mappings")
require("caconka.config.functions")

require("caconka.lazy").setup("plugins")
