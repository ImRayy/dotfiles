-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "init.lua",
	command = "source <afile> | PackerCompile",
})
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return require("packer").startup({
	function(use)
		-- Package Manager --

		use("wbthomason/packer.nvim")

		-- Required plugins --

		use("nvim-lua/plenary.nvim")

		-- Themes --

		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup()
			end,
		})

		use({
			"navarasu/onedark.nvim",
			config = function()
				require("onedark").setup({
					style = "darker",
				})
				require("onedark").load()
			end,
		})

		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				-- require'alpha'.setup(require'alpha.themes.evil'.config)
				require("plugins.configs.alpha")
			end,
		})

		use({
			"rcarriga/nvim-notify",
			config = function()
				require("plugins.configs.others").notify()
			end,
		})

		use("psliwka/vim-smoothie")

		use({
			{
				"nvim-lualine/lualine.nvim",
				event = "BufEnter",
				config = function()
					require("plugins.configs.statusline")
				end,
			},
			{
				"j-hui/fidget.nvim",
				after = "lualine.nvim",
				config = function()
					require("fidget").setup()
				end,
			},
		})

		-- Bufferline: elegant tabline
		use({
			"akinsho/bufferline.nvim",
			-- tag = "v2.*",
			config = function()
				require("plugins.configs.others").bufferline()
			end,
		})

		-- Neotree: file manager --

		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			config = function()
				require("plugins.configs.neo-tree")
			end,
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			},
		})

		-- WhichKey : Shows keybindings --

		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup()
			end,
		})

		-- Indent Blankline --

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup({
					show_current_context = true,
					show_current_context_start = true,
				})
			end,
		})

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		-- Treesitter: Better Highlights --

		use({
			"nvim-treesitter/nvim-treesitter",
			module = "nvim-treesitter",
			setup = function()
				require("core.lazyload").on_file_open("nvim-treesitter")
			end,
			cmd = require("core.lazyload").treesitter_cmds,
			run = ":TSUpdate",
			config = function()
				require("plugins.configs.treesitter")
			end,
		})

		-- Telescope: Fuzzy Finder --

		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		-- Markdown Previews
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
		})

		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})
		-- Lsp Zero: LSP and CMP stuff --

		use({
			"VonHeikemen/lsp-zero.nvim",
			config = function()
				require("plugins.configs.lspzero")
				-- local status_ok, lsp = pcall(require,'lsp-zero')
				-- if not status_ok then
				--     return
				-- end
				--
				-- lsp.preset('recommended')
				-- lsp.setup()
			end,
			requires = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },

				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("plugins.configs.others").null_ls()
			end,
			requires = { "nvim-lua/plenary.nvim" },
		})

		-- Nvim Autopairs: Autopair --

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()
			end,
		})

		-- vimwiki --

		use({
			"vimwiki/vimwiki",
			config = function()
				vim.g.vimwiki_global_ext = 0
				vim.g.vimwiki_list = {
					{
						path = "~/MEGAsync/Notes/vimwiki/",
						syntax = "markdown",
						ext = ".md",
						auto_generate_tags = 1,
						auto_generaed_links = 1,
					},
				}
			end,
		})
	end,
	config = {
		auto_clean = true,
		compile_on_sync = true,
		git = { clone_timeout = 6000 },
		display = {
			working_sym = "ﲊ",
			error_sym = "✗ ",
			done_sym = " ",
			removed_sym = " ",
			moved_sym = "",
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
