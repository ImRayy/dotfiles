require("core.keybindings")
require("core.settings")
require("core.autocmd")
require("core.bootstrap")
-- require("core.kittymargin") -- won't work with other than kitty
require("plugins")
require("plugins.configs.others")
require("plugins.configs.lsp_config")

-- Pretty print lua table
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end

-- This fixes annoying notification of transparent background reminder
require("notify").setup({
	background_colour = "#1a1b26",
})
