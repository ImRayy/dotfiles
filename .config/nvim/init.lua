require("core.keybindings")
require("core.settings")
require("core.kittymargin") -- won't work with other than kitty
require("core.bootstrap")
require("plugins")
require("plugins.configs.others")

---Pretty print lua table
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end
