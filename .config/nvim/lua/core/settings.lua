local opt = vim.o
local g = vim.g

-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

opt.termguicolors = true
-- o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
opt.timeoutlen = 500
opt.updatetime = 200

-- Number of screen lines to keep above and below the cursor
opt.scrolloff = 8

-- Better editor UI
opt.number = true
opt.numberwidth = 6
-- o.relativenumber = true
-- o.signcolumn = 'yes'
opt.cursorline = true

-- Better editing experience
opt.expandtab = true
-- o.smarttab = true
opt.cindent = true
-- o.autoindent = true
opt.wrap = true
opt.textwidth = 300
opt.tabstop = 4
opt.shiftwidth = 0
opt.softtabstop = -1 -- If negative, shiftwidth value is used
opt.list = true
opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
opt.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Undo and backup options
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
opt.history = 50

-- Better buffer splitting
opt.splitright = true
opt.splitbelow = true


-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1

-- Map <leader> to space
-- g.mapleader = ''

g.maplocalleader = ' '
