local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	return
end
local helpers = require("core/functions")

-- Saves session and send notify
function SessionSaveHandler()
	vim.cmd("SessionSave")
	helpers.send_notify("Session Saved!")
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
				action = "Lazy update",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Find Files",
				key = "f",
				action = "Telescope find_files",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Recent Files",
				key = "r",
				action = "Telescope oldfiles",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Bookmarks",
				key = "b",
				action = "Telescope marks",
			},
			{
				icon = "  ",
				icon_hl = "Title",
				desc = "Change theme",
				key = "t",
				action = "Telescope colorscheme",
			},
			{
				icon = "󰆓  ",
				icon_hl = "Title",
				desc = "Save Current Session",
				key = "s",
				action = SessionSaveHandler,
			},
		},
		-- footer = footer_text,
	},
})
