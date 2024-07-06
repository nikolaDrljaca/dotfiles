local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where we can actually apply our configs

config.color_scheme = "Catppuccin Macchiato"

config.font = wezterm.font("RecMonoLinear Nerd Font Mono")
config.font_size = 13.0
config.initial_cols = 120
config.initial_rows = 30

config.use_fancy_tab_bar = false

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- Configure to use Intel gpu
-- local gpus = wezterm.gui.enumerate_gpus()
-- config.webgpu_preferred_adapter = gpus[1]
-- config.front_end = "WebGpu"

-- force xwayland
config.enable_wayland = false

return config
