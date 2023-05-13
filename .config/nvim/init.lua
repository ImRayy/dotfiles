require("core.keybindings")
require("core.settings")
require("core.autocmd")
require("core.bootstrap")
-- require("core.kittymargin") -- won't work with other than kitty
require("plugins")
require("plugins.configs.others")
require("plugins.configs.lsp_config")

-- neovide configuration
if vim.g.neovide then
	require("core.neovide")
end

-- Pretty print lua table
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end

vim.g.neoformat_js_prettier_single_quote = 0
-- This fixes annoying notification of transparent background reminder
require("notify").setup({
	background_colour = "#1a1b26",
})
