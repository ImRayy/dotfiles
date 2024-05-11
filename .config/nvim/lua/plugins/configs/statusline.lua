local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
	return
end

require("lualine").setup({
	options = {
		theme = "auto",
		component_separators = "",
		section_separators = "",
		icons_enabled = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "mode", color = { gui = "bold" } },
		},
		lualine_b = {
			{ "branch" },
			{ "diff", colored = false },
		},
		lualine_c = {
			{ "filename", file_status = true },
			{ "diagnostics" },
		},
		lualine_x = {
			"filetype",
			"encoding",
			"fileformat",
			{
				require("noice").api.statusline.mode.get,
				cond = require("noice").api.statusline.mode.has,
				color = { fg = "#f38ba8" },
			},
		},
		lualine_y = { "progress" },
		lualine_z = {
			{ "location", color = { gui = "bold" } },
		},
	},
	tabline = {},
	extensions = { "quickfix", "nvim-tree" },
})
