vim.cmd.colorscheme "github_light_default"
vim.opt.background = "light"

vim.cmd("hi TreesitterContext guibg=white")

vim.api.nvim_command("au BufEnter * if &diff | colorscheme catppuccin | endif")
vim.api.nvim_command("au BufHidden *.{md,json,yaml,yml} if &bg == 'light' | colorscheme github_light_default | endif")
vim.api.nvim_command("au BufEnter *.{md,json,yaml,yml} colorscheme catppuccin")
