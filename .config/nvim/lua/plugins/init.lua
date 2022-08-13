-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'init.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
    function(use)
        ---------------------
        -- Package Manager --
        ---------------------

        use('wbthomason/packer.nvim')

        ----------------------
        -- Required plugins --
        ----------------------

        use('nvim-lua/plenary.nvim')

        -----------------------------------
        -- Theams --
        -----------------------------------
        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })

        use('psliwka/vim-smoothie')

        use({
            {
                'nvim-lualine/lualine.nvim',
                event = 'BufEnter',
                config = function()
                    require('plugins.configs.lualine')
                end,
            },
            {
                'j-hui/fidget.nvim',
                after = 'lualine.nvim',
                config = function()
                    require('fidget').setup()
                end,
            },
        })

        use {
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            --cmd = { "NvimTreeToggle", "NvimTreeFocus" },
            config = function()
                require('plugins.configs.nvimtree')
            end,
        }

        use {
            'goolord/alpha-nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = function()
                -- require'alpha'.setup(require'alpha.themes.evil'.config)
                require('plugins.configs.alpha')
            end,
        }

        use {
            'navarasu/onedark.nvim',
            config = function()
                require('onedark').setup {
                    style = 'darker'
                }
                require('onedark').load()
            end
        }



        -----------------------------------
        -- Nvim Autopairs: Autopair --
        -----------------------------------

        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

        -----------------------------------
        -- Treesitter: Better Highlights --
        -----------------------------------

        use({
            {
                'nvim-treesitter/nvim-treesitter',
                event = 'CursorHold',
                run = ':TSUpdate',
                setup = function()
                    require("core.lazyload")
                end,
                config = function()
                    require('plugins.configs.treesitter')
                end,
            },
            { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
            { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
            { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
        })


        -----------------------------------
        -- Telescope: Fuzzy Finder --
        -----------------------------------

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            requires = { { 'nvim-lua/plenary.nvim' } },
            config = function()
                require('plugins.configs.telescope')
            end,
        }

        -----------------------------------
        -- Lsp Zero: LSP and CMP stuff --
        -----------------------------------
        use {
            'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }


    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
