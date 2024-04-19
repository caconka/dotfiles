local function openNote()
	return ":e ~/notes/work/notes.norg <CR>"
end

vim.keymap.set("n", "<Leader>nn", openNote, { expr = true })

local function presentationMode()
	vim.fn.execute(":ZenMode")
	vim.fn.execute(":set mouse=")
end

vim.api.nvim_create_user_command("PresentationMode", presentationMode, {})

local function toggleColor()
	if (vim.opt.background:get() == "dark") then
		require("bufferline").setup({
			highlights = {
				fill = {
					fg = "#000000",
					bg = "#ffffff",
				},
			},
		})
		vim.cmd.colorscheme "github_light_default"
		vim.opt.background = "light"
	else
		require("bufferline").setup({
			highlights = {
				fill = {
					fg = "#ffffff",
					bg = "#000000",
				},
			},
		})
		vim.cmd.colorscheme "catppuccin"
		vim.opt.background = "dark"
	end
end

vim.keymap.set("n", "<Leader>tc", toggleColor, { expr = true })
vim.api.nvim_create_user_command("ToggleColor", toggleColor, {})
