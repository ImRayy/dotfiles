local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
	return
end

local ascii = {

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
}

vim.g.indent_blankline_filetype_exclude = { "dashboard" }
vim.g.indent_blankline_buftype_exclude = { "dashboard" }

dashboard.setup({
	theme = "hyper",
	config = {
		header = ascii,
		shortcut = {
			{
				desc = " Update",
				group = "@property",
				action = "Lazy update",
				key = "u",
			},
			{
				desc = " Files",
				icon_hl = "@variable",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Bookmarks",
				group = "DiagnosticHint",
				action = "Telescope marks",
				key = "b",
			},
			{
				desc = " Projects",
				group = "Number",
				action = "Telescope projects",
				key = "p",
			},
		},
	},
})
