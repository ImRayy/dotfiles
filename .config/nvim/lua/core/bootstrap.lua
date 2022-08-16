local status_ok, packer = pcall(require,'packer')

if status_ok then
    return
end

vim.defer_fn(function()
    pcall(require, "impatient")
end, 0)

-- setup packer + plugins
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2d2e3b" })
    print ("Cloning Packer", "-->",install_path)
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

    -- install plugins + compile their configs
    vim.cmd "packadd packer.nvim"
    require "plugins"
    vim.cmd "PackerSync"
end