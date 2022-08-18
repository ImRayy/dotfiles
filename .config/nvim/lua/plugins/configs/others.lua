local M = {}

M.notify = function()
    local status_ok, nvimnotify = pcall(require, 'notify')
    if not status_ok then
        return
    end
    nvimnotify.setup({
        stages = 'fade'
    })
    vim.notify = nvimnotify

end

M.null_ls = function()
    local status_ok, null_ls = pcall(require, 'null-ls')

    if not status_ok then
        return
    end

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    local code_actions = null_ls.builtins.code_actions
    null_ls.setup({
        debug = false,
        sources = {
            formatting.prettier.with { extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' } },
            formatting.black.with { extra_args = { '--fast' } },
            formatting.stylua,
            diagnostics.flake8,
            -- diagnostics.misspell,
            completion.spell,
        }
    })
end

M.bufferline = function()
    local status_ok, bufferline = pcall(require, "bufferline")
    if not status_ok then
        return
    end

    bufferline.setup {
        options = {
            offsets = {
                { filetype = "NvimTree", text = "", padding = 1 },
                { filetype = "neo-tree", text = "", padding = 1 },
                { filetype = "Outline", text = "", padding = 1 },
            },

            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
            diagnostics = "nvim_lsp",
        }
    }
end
return M
