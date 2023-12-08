local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({

	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "mocha",
		dark = "mocha",
	},
	transparent_background = true,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = true,
		mini = false,
	},
})

-- vim.cmd.colorscheme("catppuccin")
