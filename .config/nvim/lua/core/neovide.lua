local options = {

	-- General
	transparency = 0.8,
	hide_mouse_when_typing = true,
	remember_window_size = true,

	-- Visuals/animations
	cursor_vfx_mode = "sonicboom",
	adding_top = 0,
	padding_bottom = 0,
	padding_right = 0,
	padding_left = 0,
}

for x, y in pairs(options) do
	vim.g["neovide_" .. x] = y
end
