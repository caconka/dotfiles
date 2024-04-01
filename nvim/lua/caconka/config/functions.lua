local function openNote()
	return ":e ~/notes/work/notes.norg <CR>"
end

vim.keymap.set("n", "<Leader>nn", openNote, { expr = true })

local function presentationMode()
	vim.fn.execute(":ZenMode")
	vim.fn.execute(":set mouse=")
end

vim.api.nvim_create_user_command("PresentationMode", presentationMode, {})

vim.api.nvim_create_user_command("Blame", "ToggleBlame", {})

local function toggleColor()
	if (vim.opt.background:get() == "dark") then
		vim.opt.background = "light"
		vim.cmd("colorscheme github_light_default")
	else
		vim.opt.background = "dark"
		vim.cmd("colorscheme zenbones")
	end
end

vim.keymap.set("n", "<Leader>tc", toggleColor, { expr = true })
vim.api.nvim_create_user_command("ToggleColor", toggleColor, {})
