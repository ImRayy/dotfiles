local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	return
end

local ascii = {
	"",
	"",
	"",
	"",
	"",
	"",
	"          ▀████▀▄▄              ▄█ ",
	"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
	"    ▄        █          ▀▀▀▀▄  ▄▀  ",
	"   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
	"  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
	"  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
	"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
	"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
	"   █   █  █      ▄▄           ▄▀   ",
	"",
	"",
	-- " [ TIP: To exit NeoVim, switch off MCB of your house. ] ",
	"",
}

local footer_text = {
	"",
}

-- vim.g.indent_blankline_filetype_exclude = { "dashboard" }
-- vim.g.indent_blankline_buftype_exclude = { "dashboard" }

dashboard.setup({
	theme = "doom",
	config = {
		header = ascii,
		center = {
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Update Plugins                  ",
				key = "u",
				keymap = "SPC u u",
				action = "Lazy update",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Find Files",
				key = "f",
				keymap = "SPC f f",
				action = "Telescope find_files",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Recent Files",
				key = "r",
				keymap = "SPC f r",
				action = "Telescope oldfiles",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Bookmarks",
				key = "b",
				keymap = "SPC f b",
				action = "Telescope marks",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Change theme",
				key = "t",
				keymap = "SPC h t",
				action = "Telescope marks",
			},
		},
		-- footer = footer_text,
	},
})
