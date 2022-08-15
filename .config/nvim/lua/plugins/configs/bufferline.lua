local present, bufferline = pcall(require, "bufferline")
if not present then
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
        buffer_close_icon = "",
        modified_icon = "",
    }
}