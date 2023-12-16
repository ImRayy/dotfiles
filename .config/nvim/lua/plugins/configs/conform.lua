local options = {

    formatters_bu_ft = {
        ["css"] = { "prettier" },
        ["html"] = { "prettier" },
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["json"] = { "prettier" },
        ["lua"] = { "stylua" },
        ["markdown"] = { "prettier" },
        ["python"] = { "black", "yapf" },
        ["svelete"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
    },

    format_on_save = {
        lsp_fallback = true,
        async = true,
    },
}

return options
