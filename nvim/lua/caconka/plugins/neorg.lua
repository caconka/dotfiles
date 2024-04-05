return {
	"nvim-neorg/neorg",
	lazy = false,
	--version = "*", -- Pin Neorg to the latest stable release
	version = "v7.0.0",
	-- dependencies = { "luarocks.nvim" },
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = { config = { icon_preset = "diamond" } },
				["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
				["core.integrations.nvim-cmp"] = {},
				["core.export"] = {},
				["core.keybinds"] = {
					config = {
						neorg_leader = "<Space>"
					}
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							home = "~/notes/home",
							work = "~/notes/work"
						},
						default_workspace = "home",
					},
				},
			},
		})

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2

		vim.keymap.set("n", "<Leader>ni", ":Neorg index<CR>", { silent = true })
		vim.keymap.set("n", "<Leader>nw", ":Neorg workspace work<CR>", { silent = true })
		vim.keymap.set("n", "<Leader>nh", ":Neorg workspace home<CR>", { silent = true })
	end,
}
