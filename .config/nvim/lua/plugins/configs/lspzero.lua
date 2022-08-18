local status_ok, lsp = pcall(require,'lsp-zero')
if not status_ok then
    return
end

require('mason').setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

lsp.preset('recommended')
lsp.setup()