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

	null_ls.setup({
		debug = false,
		sources = {
			formatting.prettier,
			formatting.stylua,
			formatting.black.with({ extra_args = { "--fast" } }),
			completion.spell,
			diagnostics.selene,
			require("none-ls.diagnostics.eslint"),
			require("none-ls.diagnostics.flake8"),
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
		accept_keymap = "<C-e>",
		dismiss_keymap = "<C-]>",
		debounce_ms = 800,
		suggestion_color = { gui = "#808080", cterm = 244 },
		exclude_filetypes = { "TelescopePrompt" },
	})
end

M.blankline = {
	enabled = true,
	exclude = {
		filetypes = { "dashboard" },
		buftypes = { "terminal" },
	},
	indent = {
		tab_char = { "." },
	},
}

M.autosession = {
	auto_session_root_dir = os.getenv("HOME") .. "/" .. ".neovim_sessions/",
	auto_session_enable_last_session = false,
	auto_session_create_enabled = false,
	auto_session_suppress_dirs = { "~/", "~/Downloads/", "/" },
	session_lens = {
		buftypes_to_ignore = {},
		load_on_setup = true,
		theme_conf = { border = true },
		prompt_title = "Projects",
	},
}

return M
