-- Auto format code on save just like vscode :)
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[autocmd BufWritePre * Neoformat]])
