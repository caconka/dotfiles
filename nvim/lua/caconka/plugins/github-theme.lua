return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,
	config = function()
		require("github-theme").setup({
			options = {
				styles = {
					comments = "italic",
					functions = "NONE",
					keywords = "NONE",
					variables = "NONE",
					conditionals = "NONE",
					constants = "italic",
					numbers = "NONE",
					operators = "NONE",
					strings = "italic",
					types = "NONE",
				},
			},
			palettes = {
				github_light_default = {
					black = {
						base = "#000000",
						bright = "#262626",
					},
					blue = {
						base = "#0033b3",
						bright = "#0041e5",
					},
					cyan = {
						base = "#00627a",
						bright = "#0091b4",
					},
					green = {
						base = "#067d17",
						bright = "#09b321",
					},
					magenta = {
						base = "#871094",
						bright = "#b215c3",
					},
					gray = {
						base = "#8c8c8c",
						bright = "#9d9d9d",
					},
					yellow = {
						base = "#9e880d",
						bright = "#cdb011",
					},
					orange = "#ff9e0d",
					attention = {
						emphasis = "#ffcc00",
						fg = "#ffcc00",
					}
				}
			},
			specs = {
				github_light_default = {
					syntax = {
						bracket = "black",
						builtin0 = "black",
						builtin1 = "blue",
						builtin2 = "blue",
						comment = "gray",
						conditional = "black",
						const = "magenta",
						dep = "black",
						field = "red",
						func = "black",
						ident = "black",
						keyword = "blue",
						number = "blue",
						operator = "black",
						param = "black",
						preproc = "black",
						regex = "black",
						statement = "black",
						string = "green",
						tag = "blue",
						type = "black",
						variable = "black"
					}
				}
			}
		})

		vim.api.nvim_command("hi DiffChange guifg=#7a6326 guibg=#e5d5ac")
		vim.api.nvim_command("hi DiffText guifg=black guibg=#f5eede")
	end,
}
