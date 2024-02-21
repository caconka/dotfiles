local function openNote()
	return ":e ~/notes/work/notes.norg <CR>"
end
vim.keymap.set("n", "<Leader>nn", openNote, { expr = true })

vim.api.nvim_create_user_command("Date", ":pu=strftime('%Y-%m-%d')", {})

vim.api.nvim_create_user_command("Blame", "ToggleBlame", {})
