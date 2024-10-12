local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.color_scheme = 'AdventureTime'
config.font = wezterm.font('Cascadia Code')
config.font_size = 10.5

config.color_scheme = 'Catppuccin Latte'
config.colors = {
	background = 'white',
	foreground = '#080808',
	cursor_bg = '#080808',
}

config.enable_tab_bar = false

return config
