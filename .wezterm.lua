-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.window_decorations = 'RESIZE'
config.enable_tab_bar = false
config.window_background_opacity = 0.94
config.font = wezterm.font 'InconsolataGo Nerd Font'
config.color_scheme = 'Monokai (base16)'
config.font_size = 15.0
config.line_height = 1.3

-- and finally, return the configuration to wezterm
return config
