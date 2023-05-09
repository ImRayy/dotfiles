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

		-- UI | Themes --

		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup()
			end,
		})

		-- Onedark Colorscheme
		-- use({
		-- 	"navarasu/onedark.nvim",
		-- 	config = function()
		-- 		require("onedark").setup({
		-- 			style = "darker",
		-- 		})
		-- 		require("onedark").load()
		-- 	end,
		-- })

		-- Catppuccin
		use({
			"catppuccin/nvim",
			name = "catppuccin",
			config = function()
				require("plugins.configs.catppuccin")
			end,
		})

		-- Statrup Screen
		-- use({
		-- 	"goolord/alpha-nvim",
		-- 	requires = { "kyazdani42/nvim-web-devicons" },
		-- 	config = function()
		-- 		require("plugins.configs.alpha")
		-- 	end,
		-- })

		use({
			"glepnir/dashboard-nvim",
			event = "VimEnter",
			config = function()
				require("plugins.configs.dashboard")
			end,
			requires = { "nvim-tree/nvim-web-devicons" },
		})

		use({
			"folke/noice.nvim",
			config = function()
				require("noice").setup()
			end,
			requires = {
				"MunifTanjim/nui.nvim",
			},
		})

		use({
			"rcarriga/nvim-notify",
			config = function()
				require("plugins.configs.others").notify()
			end,
		})

		-- Smooth Scrolling
		use("psliwka/vim-smoothie")

		-- Status Bar
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

		-- Neotree: file picker --
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			config = function()
				require("plugins.configs.neo-tree")
			end,
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended "MunifTanjim/nui.nvim",
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

		-- Makes Commenting Easy
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		-- nvim-ts-autotag
		use({
			"windwp/nvim-ts-autotag",
		})

		-- Treesitter: Better Highlights --
		use({
			"nvim-treesitter/nvim-treesitter",
			module = "nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins.configs.treesitter")
			end,
		})

		-- Telescope: Fuzzy Finder --
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("telescope").load_extension("session-lens")
			end,
			requires = {
				{ "nvim-lua/plenary.nvim" },
			},
		})

		-- Markdown Preview
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})

		-- mason
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		})

		-- Neoformat for formating code
		use({ "sbdchd/neoformat" })

		-- Nvim cmp and snippet stuff
		use({
			{
				"hrsh7th/nvim-cmp",
				event = "InsertEnter",
				config = function()
					require("plugins.configs.nvim-cmp")
				end,
				requires = {
					{
						"L3MON4D3/LuaSnip",
						event = "InsertEnter",
						config = function()
							require("plugins.configs.luasnip")
						end,
						requires = {
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
		})

		-- tabnine
		-- use({
		-- 	"codota/tabnine-nvim",
		-- 	config = function()
		-- 		require("plugins.configs.others").tabnine()
		-- 	end,
		-- 	run = "./dl_binaries.sh",
		-- })

		-- null.ls
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

		-- Autohighlight word under cursor
		use({
			"echasnovski/mini.cursorword",
			branch = "stable",
			config = function()
				require("mini.cursorword").setup()
			end,
		})

		use({
			"rmagatti/auto-session",
			config = function()
				require("auto-session").setup({
					auto_session_root_dir = "~/.neovim_sessions/",
					auto_session_enable_last_session = true,
					auto_session_create_enabled = false,
					auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
				})
			end,
		})

		use({
			"rmagatti/session-lens",
			requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
			config = function()
				require("session-lens").setup({
					path_display = { "shorten" },
					theme_conf = { border = true },
					prompt_title = "RAY SESSIONS",
				})
			end,
		})

		-- vimwiki: Note taking env
		-- use({
		-- 	"vimwiki/vimwiki",
		-- 	config = function()
		-- 		vim.g.vimwiki_global_ex = 0
		-- 		vim.g.vimwiki_list = {
		-- 			{
		-- 				path = "~/MEGAsync/Notes/vimwiki/",
		-- 				syntax = "markdown",
		-- 				ext = ".md",
		-- 				auto_generate_tags = 1,
		-- 				auto_generaed_links = 1,
		-- 			},
		-- 		}
		-- 	end,
		-- })
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
