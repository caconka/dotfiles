vim.cmd.colorscheme "github_light_default"
vim.opt.background = "light"

vim.cmd("hi TreesitterContext guibg=white")

vim.api.nvim_command("au BufEnter * if &diff | colorscheme catppuccin | endif")
vim.api.nvim_command("au BufHidden *.{md,json,yaml,yml} colorscheme github_light_default")
vim.api.nvim_command("au BufEnter *.{md,json,yaml,yml} colorscheme catppuccin")
