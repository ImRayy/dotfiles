local wezterm = require("wezterm")

-- FONT FAMILY
local function fallback_font(font, params)
	local fonts = { font, "Fira Code", "Cartograph CF" }
	return wezterm.font_with_fallback(fonts, params)
end
local font_family = "CaskaydiaCove Nerd Font"

return {

	-- GENERAL
	window_background_opacity = 1,
	default_cursor_style = "BlinkingUnderline",
	front_end = "OpenGL",

	-- TAB BAR
	enable_tab_bar = true,
	tab_bar_at_bottom = false,
	show_tab_index_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = true,

	-- FONT
	font = fallback_font(font_family),
	font_rules = {
		{
			intensity = "Bold",
			font = fallback_font(font_family, { weight = "Regular" }),
		},
		{
			italic = true,
			font = fallback_font("Cartograph CF", { style = "Italic" }),
		},
		{
			italic = false,
			font = fallback_font(font_family, { weight = "Regular" }),
		},
		{
			intensity = "Half",
			italic = false,
			font = fallback_font(font_family, { weight = "Light" }),
		},
	},
	font_size = 12,
	line_height = 1.1,
	font_shaper = "Harfbuzz",

	-- COLORSCHEME
	-- color_scheme = "Colorful Colors (terminal.sexy)",
	color_scheme = "Dracula",
	colors = {
		background = "#1F2329",
	},

	-- WINDOW PADDING
	window_padding = {
		top = 20,
		right = 20,
		bottom = 20,
		left = 20,
	},
}
