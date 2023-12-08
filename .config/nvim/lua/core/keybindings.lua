local function map(m, k, v)
	vim.api.nvim_set_keymap(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map("n", "*", "*N")

-- Fix n and N. Keeping cursor in center
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- Quickly save the current buffer or all buffers
map("n", "<leader>w", ":update<CR>")
map("n", "<leader>W", ":wall<CR>")

-- Quit neovim
map("n", "<C-Q>", ":q!<CR>")

-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("n", "<C-j>", ":move .+1<CR>")
map("n", "<C-k>", ":move .-2<CR>")
map("x", "<C-j>", ":move '>+1<CR>gv=gv")
map("x", "<C-k>", ":move '<-2<CR>gv=gv")

-- telescope
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>bf", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")

-- Neotree
map("n", "<C-n>", ":Neotree toggle reveal_force_cwd<CR>")

-- BarBar
map("n", "<A-L>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A-H>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<A-l>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-h>", "<Cmd>BufferNext<CR>", opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<C-f>", ":lua require('core.utils').format_on_save()<CR>")
map("n", "<C-m>", ":MarkdownPreview<CR>")

-- Comments

local opt = { expr = true, remap = true, replace_keycodes = false }

-- Toggle in VISUAL mode
map("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)")

map("x", "<S-y>", ":w !wl-copy<CR><CR>")

map("i", "<C-h>", "<Esc>caw", { noremap = true })

-- Spell check
map("n", "<leader>s", ":setlocal spell spelllang=en_us<CR>")
