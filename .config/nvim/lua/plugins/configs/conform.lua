local function is_format_enabled(bufnr)
	if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
		return
	end
end

local slow_format_filetypes = { "typescript", "typescriptreact", "javascriptreact" }

options = {
	formatters_by_ft = {
		astro = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		python = { "black", "yapf" },
		svelete = { "prettier" },
		javascript = { { "prettier", "prettierd" } },
		javascriptreact = { "prettier" },
		typescript = { { "prettier", "prettierd" } },
		typescriptreact = { "prettier" },
		yaml = { "prettier" },
		sh = { "shfmt" },
	},

	format_on_save = function(bufnr)
		if is_format_enabled(bufnr) then
			return
		end

		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		if slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		local function on_format(err)
			if err and err:match("timeout$") then
				slow_format_filetypes[vim.bo[bufnr].filetype] = true
			end
		end

		return { timeout_ms = 200, lsp_fallback = true }, on_format
	end,

	format_after_save = function(bufnr)
		if is_format_enabled(bufnr) then
			return
		end

		if not slow_format_filetypes[vim.bo[bufnr].filetype] then
			return
		end
		return { lsp_fallback = true }
	end,
}

return options
