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

config.window_decorations = "RESIZE"
config.window_frame = {
	-- font = wezterm.font({ family = "RecMonoLinear Nerd Font Mono", weight = "Bold" }),
	font_size = 11,
}

wezterm.on("update-status", function(window)
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	local color_scheme = window:effective_config().resolved_palette
	local bg = color_scheme.background
	local fg = color_scheme.foreground

	window:set_right_status(wezterm.format({
		-- first draw the arrow
		{ Background = { Color = "none" } },
		{ Foreground = { Color = bg } },
		{ Text = SOLID_LEFT_ARROW },
		-- then we draw text
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = " " .. wezterm.hostname() .. " " },
	}))
end)

-- remaps
local function move_pane(key, direction)
	return {
		key = key,
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection(direction),
	}
end
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	move_pane("j", "Down"),
	move_pane("k", "Up"),
	move_pane("h", "Left"),
	move_pane("l", "Right"),
}

-- Configure to use Intel gpu
-- local gpus = wezterm.gui.enumerate_gpus()
-- config.webgpu_preferred_adapter = gpus[1]
-- config.front_end = "WebGpu"

-- force xwayland
-- config.enable_wayland = false

return config
