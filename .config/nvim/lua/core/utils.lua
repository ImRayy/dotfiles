local M = {}

M.format_on_save = function()
	if neoformat_enabled then
		vim.api.nvim_command("autocmd! BufWritePre")
		neoformat_enabled = false
		print("Format on save disabled")
	else
		vim.api.nvim_command("autocmd BufWritePre * Neoformat")
		neoformat_enabled = true
		print("Format on save disabled")
	end
end

return M
