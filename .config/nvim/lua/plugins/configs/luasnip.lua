local types = require("luasnip.util.types")

-- For friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()
-- For custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snips" } })

-- Allow jsx and tsx to use js snippets
require("luasnip").filetype_extend("javascript", { "javascriptreact", "typescriptreact" })

-- Mappins to move around inside snippets
vim.keymap.set({ "i", "s" }, "<C-j>", '<CMD>lua require("luasnip").jump(1)<CR>')
vim.keymap.set({ "i", "s" }, "<C-k>", '<CMD>lua require("luasnip").jump(-1)<CR>')
