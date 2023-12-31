local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 3,
		width = 45,
		align_shortcut = "right",
		hl = "AlphaButtons",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end,
		opts = opts,
	}
end

local logo = {
	[[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
	[[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
	[[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
	[[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
	[[██   ████ ███████  ██████    ████   ██ ██      ██]],
}

-- Buttons
local buttons = {
	type = "group",
	val = {
		button("u", "󰐱  Update plugins", "<cmd>Lazy update<cr>"),
		button("f", "  Find files", "<cmd>Telescope find_files<cr>"),
		button("n", "󰷈  Find Notes", "<cmd>Telekasten find_notes<cr>"),
		button("t", "  Change theme", "<cmd>Telescope colorscheme<cr>"),
		button("q", "󰅚  Quit", "<cmd>:qa<cr>"),
	},
	opts = {
		spacing = 1,
	},
}

-- Header
-- Dynamic header padding
local fn = vim.fn
local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * 0.3) })

local header = {
	type = "text",
	val = logo,
	opts = {
		position = "center",
		hl = "AlphaHeader",
	},
}

-- Footer
local footer = {
	type = "text",
	val = "",
	opts = {
		position = "center",
		hl = "Number",
	},
}

local section = {
	header = header,
	buttons = buttons,
	footer = footer,
}

local config = {
	layout = {
		{ type = "padding", val = headerPadding },
		section.header,
		{ type = "padding", val = 2 },
		section.buttons,
		section.footer,
	},
}

return {
	section = section,
	opts = config,
}
