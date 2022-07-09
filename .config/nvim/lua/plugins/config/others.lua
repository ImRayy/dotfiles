local M = {}

local load_override = require("core.utils").load_override

M.devicons = function()
   local present, devicons = pcall(require, "nvim-web-devicons")

   if present then
      require("base46").load_highlight "devicons"

      local options = { override = require("ui.icons").devicons }
      options = require("core.utils").load_override(options, "kyazdani42/nvim-web-devicons")

      devicons.setup(options)
   end
end

return M
