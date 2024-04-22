if vim.loader then
	vim.loader.enable()
end

vim.g.mapleader = " "

require("caconka.lazy")
require("caconka.config.theme")
require("caconka.config.options")
require("caconka.config.mappings")
require("caconka.config.functions")
