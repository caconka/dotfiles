vim.o.termguicolors = true
vim.cmd.colorscheme "catppuccin"
vim.opt.background = "light"

-- vim.cmd("hi TreesitterContext guibg=white guifg=#000000")


-- vim.api.nvim_command("au BufHidden *.{md,json,yaml,yml} if &bg == 'light' | colorscheme github_light_default | endif")
-- vim.api.nvim_command("au BufEnter *.{md,json,yaml,yml} colorscheme catppuccin")
-- vim.api.nvim_command("au BufHidden *.{java} if &bg == 'light' | colorscheme catppuccin | endif")
-- vim.api.nvim_command("au BufEnter *.{java} colorscheme github_light_default")
-- vim.api.nvim_command("au BufEnter * if &diff | colorscheme catppuccin | endif")
