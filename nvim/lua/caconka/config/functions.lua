local function todayNote()
	local fileName = os.date("%y-%m-%d.norg")

	return ":e ~/notes/ephemeral/"..fileName.."<CR>"
end

vim.keymap.set("n", "<Leader>nn", todayNote, { expr = true })

vim.api.nvim_create_user_command("Blame", "ToggleBlame", {})
