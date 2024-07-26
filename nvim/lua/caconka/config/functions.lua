local function presentationMode()
	vim.fn.execute(":ZenMode")
	vim.fn.execute(":set mouse=")
end

vim.api.nvim_create_user_command("PresentationMode", presentationMode, {})

local function toggleColor()
	if (vim.opt.background:get() == "dark") then
		vim.opt.background = "light"
	else
		vim.opt.background = "dark"
	end
end

vim.keymap.set("n", "<Leader>tc", toggleColor, { expr = true })
