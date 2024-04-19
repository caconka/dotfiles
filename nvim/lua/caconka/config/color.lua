vim.api.nvim_command("au BufEnter * if &diff | colorscheme catppuccin | endif")
vim.api.nvim_command("au BufLeave *.{md,json,yaml,yml} colorscheme github_light_default")
vim.api.nvim_command("au BufEnter *.{md,json,yaml,yml} colorscheme catppuccin")
