require('core.keybindings')
require('core.settings')
require('core.kittymargin')  -- won't work with other than kitty
require('plugins')


function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

-- calling lsp-zero

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()