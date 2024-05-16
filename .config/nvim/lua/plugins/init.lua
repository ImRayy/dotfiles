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
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			return require("plugins.configs.alpha")
		end,
		config = function(_, dashboard)
			require("alpha").setup(dashboard.opts)
			vim.api.nvim_create_autocmd("User", {
				callback = function()
					local stats = require("lazy").stats()
					local ms = math.floor(stats.startuptime * 100) / 100
					dashboard.section.footer.val = "󱐌 Lazy-loaded "
						.. stats.loaded
						.. " out of "
						.. stats.count
						.. " plugins in "
						.. ms
						.. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
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
		opts = function()
			return require("plugins.configs.noice-nvim")
		end,
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
		opts = {
			sidebar_filetypes = {
				["neo-tree"] = { event = "BufWipeout" },
			},
		},
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
			ensure_installed = require("utils.ensure_installed").servers,
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
	{ "hrsh7th/cmp-path", after = "nvim-cmp" },
	{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },

	-- None-ls
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("plugins.configs.others").null_ls()
		end,
	},

	-- Trouble
	{
		"folke/trouble.nvim",
		branch = "dev",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	-- Code Format
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConfirmInfo" },
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

	-- AI Helper
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			vim.keymap.set("i", "<C-e>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
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
