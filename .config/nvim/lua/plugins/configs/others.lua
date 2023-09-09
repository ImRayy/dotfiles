local M = {}

M.notify = function()
	local status_ok, nvimnotify = pcall(require, "notify")
	if not status_ok then
		return
	end
	-- polish = function()
	nvimnotify.setup({
		background_colour = "#1a1b26",
		stages = "fade",
	})
	vim.notify = nvimnotify
end

M.null_ls = function()
	local status_ok, null_ls = pcall(require, "null-ls")

	if not status_ok then
		return
	end

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local completion = null_ls.builtins.completion
	local code_actions = null_ls.builtins.code_actions
	null_ls.setup({
		debug = false,
		sources = {
			formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
			formatting.black.with({ extra_args = { "--fast" } }),
			formatting.stylua,
			diagnostics.flake8,
			-- diagnostics.misspell,
			completion.spell,
		},
	})
end

M.bufferline = function()
	local status_ok, bufferline = pcall(require, "bufferline")
	if not status_ok then
		return
	end

	bufferline.setup({
		options = {
			offsets = {
				{ filetype = "NvimTree", text = "", padding = 1 },
				{ filetype = "neo-tree", text = "", padding = 1 },
				{ filetype = "Outline", text = "", padding = 1 },
			},

			text = "File Explorer",
			highlight = "Directory",
			text_align = "center",
			diagnostics = "nvim_lsp",
		},
	})
end

M.notify = function()
	local status_ok, notify = pcall(require, "notify")
	if not status_ok then
		return
	end
	notify.setup({
		fps = 60,
		timeout = 1000,
		level = 2,
		minimum_width = 50,
		render = "minimal",
		stages = "fade_in_slide_out",
	})
end

M.tabnine = function()
	local status_ok, tabnine = pcall(require, "tabnine")
	if not status_ok then
		return
	end

	tabnine.setup({
		disable_auto_comment = true,
		accept_keymap = "<Tab>",
		dismiss_keymap = "<C-]>",
		debounce_ms = 800,
		suggestion_color = { gui = "#808080", cterm = 244 },
		exclude_filetypes = { "TelescopePrompt" },
	})
end

M.blankline = {
	indentLine_enabled = 1,
	filetype_exclude = {
		"help",
		"terminal",
		"lazy",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"mason",
		"nvdash",
		"nvcheatsheet",
		"dashboard",
	},
	buftype_exclude = { "terminal" },
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	show_current_context = true,
	show_current_context_start = true,
}

M.autosession = {
    auto_session_root_dir = os.getenv("HOME") .. "/" .. ".neovim_sessions/",
	auto_session_enable_last_session = true,
	auto_session_create_enabled = false,
	auto_session_suppress_dirs = { "~/", "~/Downloads/", "/" },
}

return M
