return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		require'nvim-tmux-navigation'.setup({
			disable_when_zoomed = true,
			keybindings = {
				left = "<M-h>",
				down = "<M-j>",
				up = "<M-k>",
				right = "<M-l>",
				last_active = "<M-;>",
				next = "<M-\\>",
			}
		})
	end,
}
