return {

    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.configs.catppuccin")
        end,
    },

    -- Dashboard
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("plugins.configs.dashboard")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Indent blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = function()
            return require("plugins.configs.others").blankline
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        module = "nvim-treesitter",
        run = ":TSUpdate",
        opts = function()
            return require("plugins.configs.treesitter")
        end,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    -- Autohighlight word under cursor
    {
        "echasnovski/mini.cursorword",
        branch = "stable",
        opts = {},
    },

    -- nvim.notify
    {
        "rcarriga/nvim-notify",
        config = function()
            require("plugins.configs.others").notify()
        end,
    },

    -- Noice: Command UI
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {},
    },

    -- WhichKey : Shows keybindings
    {

        "folke/which-key.nvim",
        opts = {},
    },

    -- Smooth Scrolling
    { "psliwka/vim-smoothie" },

    -- Status Bar
    {
        "nvim-lualine/lualine.nvim",
        event = "BufEnter",
        opts = function()
            return require("plugins.configs.statusline")
        end,
    },

    -- Buffer
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {},
    },

    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        after = "lualine.nvim",
        opts = {},
    },

    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        opts = function()
            return require("plugins.configs.neo-tree")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Telekasten: Note organization
    {
        "renerocksai/telekasten.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        opts = {
            home = vim.fn.expand("$HOME/Documents/Notes/Obsidian"),
        },
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    -- Autocompletion stuff
    {
        "williamboman/mason-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = require("utils").servers,
            automatic_installation = true,
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                event = { "BufReadPre", "BufNewFile" },
                cmd = { "Mason" },
                opts = function()
                    return require("plugins.configs.mason")
                end,
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        event = "BufReadPre",
        config = function()
            require("plugins.configs.lsp")
        end,
    },

    -- Nvim cmp
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("plugins.configs.nvim-cmp")
        end,
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                event = "InsertEnter",
                opts = function()
                    return require("plugins.configs.luasnip")
                end,
                dependencies = {
                    {
                        "rafamadriz/friendly-snippets",
                        event = "CursorHold",
                    },
                },
            },
        },
    },

    { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    { "hrsh7th/cmp-path",         after = "nvim-cmp" },
    { "hrsh7th/cmp-buffer",       after = "nvim-cmp" },

    -- Null.ls
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            automatic_setup = true,
            ensure_installed = require("utils").linters,
            automatic_installation = true,
        },
        dependencies = {
            {

                "jose-elias-alvarez/null-ls.nvim",
                dependencies = "nvim-lua/plenary.nvim",
                config = function()
                    require("plugins.configs.others").null_ls()
                end,
            },
        },
    },

    -- Code Format
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = {"ConfirmInfo"},
        opts = function()
            return require("plugins.configs.conform")
        end,
    },

    -- Session Manager
    {
        "rmagatti/auto-session",
        opts = function()
            return require("plugins.configs.others").autosession
        end,
    },

    -- Tabnine AI
    {
        "codota/tabnine-nvim",
        build = "./dl_binaries.sh",
        config = function()
            require("plugins.configs.others").tabnine()
        end,
    },

    -- Makes Commenting Easy
    {
        "numToStr/Comment.nvim",
        opts = {},
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- Nvim-colorizer
    {
        "NvChad/nvim-colorizer.lua",
        opts = {},
    },
}
