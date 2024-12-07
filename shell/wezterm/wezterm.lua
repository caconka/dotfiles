local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.color_scheme = 'AdventureTime'
-- config.font = wezterm.font('Cascadia Code')
-- config.font_size = 10.5
config.font = wezterm.font('SF Mono', { weight = 'Medium' })
config.font_size = 10.25
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- disable ligatures

config.window_padding = {
	left = '0.33cell',
	right = 0,
	top = '0.2cell',
	bottom = 0,
}

config.color_scheme = 'Catppuccin Latte'
config.colors = {
	background = 'white',
	foreground = '#080808',
	cursor_bg = '#080808',
	cursor_border = '#080808',
}

config.enable_tab_bar = false

return config
