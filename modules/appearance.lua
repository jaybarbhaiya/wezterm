local wezterm = require("wezterm")

return {
	-- color_scheme = "Catppuccin Latte",
	-- color_scheme = "Vs Code Light+ (Gogh)",
	-- color_scheme = "iTerm2 Dark Background",
	color_scheme = "Windows High Contrast Light (base16)",

	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" }),
	font_size = 14,

	-- Window borders configuration - prominent borders
	window_frame = {
		active_titlebar_bg = "#2b2b2b",
		active_titlebar_fg = "#e0e0e0",
		inactive_titlebar_bg = "#1a1a1a",
		inactive_titlebar_fg = "#808080",
		border_left_width = 4,
		border_right_width = 4,
		border_top_height = 4,
		border_bottom_height = 4,
		border_left_color = "#5a5a5a",
		border_right_color = "#5a5a5a",
		border_top_color = "#5a5a5a",
		border_bottom_color = "#5a5a5a",
	},
}
