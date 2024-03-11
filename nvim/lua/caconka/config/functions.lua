local function openNote()
	return ":e ~/notes/work/notes.norg <CR>"
end

vim.keymap.set("n", "<Leader>nn", openNote, { expr = true })

local function presentationMode()
	vim.fn.execute(":ZenMode")
	vim.fn.execute(":set mouse=")
end

vim.api.nvim_create_user_command("PresentationMode", presentationMode, {})

vim.api.nvim_create_user_command("Date", ":pu=strftime('%Y-%m-%d')", {})

vim.api.nvim_create_user_command("Blame", "ToggleBlame", {})
