return {
	"epwalsh/obsidian.nvim",
	version = "*",  -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	keys = {
		{ "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
		{ "<leader>nf", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
		{ "<leader>np", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
		{ "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
		{ "<leader>nt", "<cmd>ObsidianTemplate<cr>", desc = "Follow link under cursor", mode = "n" },
	},
	dependencies = {"nvim-lua/plenary.nvim"},
	config = function ()
		require("obsidian").setup({
			workspaces = {
				{
					name = "notes",
					path = "~/notes",
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			notes_subdir = "ephemeral",
			new_notes_location = "notes_subdir",
			preferred_link_style = "markdown",
			wiki_link_func = function(opts)
				if opts.id == nil then
					return string.format("[[%s]]", opts.label)
				elseif opts.label ~= opts.id then
					return string.format("[[%s|%s]]", opts.id, opts.label)
				else
					return string.format("[[%s]]", opts.id)
				end
			end,
			mappings = {
				-- Toggle check-boxes "obsidian done"
				["<leader>nc"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				}
			},
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				tags = "",
			},
			note_frontmatter_func = function(note)
				local out = { id = note.id, tags = note.tags, title = note.title }

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,
		})
	end
}
