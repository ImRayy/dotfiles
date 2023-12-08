local options = {

	-- General
	hide_mouse_when_typing = true,
	remember_window_size = false,

	-- Visuals/animations
	cursor_vfx_mode = "wireframe",
    padding_top = 20,
	padding_bottom = 20,
	padding_right = 20,
	padding_left = 20,

    -- Theme
    transparency = 1,

}

for x, y in pairs(options) do
	vim.g["neovide_" .. x] = y
end
