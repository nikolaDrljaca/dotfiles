local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where we can actually apply our configs

config.color_scheme = "Gruvbox dark, medium (base16)"

config.font = wezterm.font("Hurmit Nerd Font")
config.font_size = 12.0
config.initial_cols = 120
config.initial_rows = 30

return config
