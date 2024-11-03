local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Macchiato"

-- config.font = wezterm.font("RecMonoLinear Nerd Font Mono")
config.font_size = 13.0

-- size
config.initial_cols = 120
config.initial_rows = 30

return config
