local map = require("utils").map

-- General Settings
map("n", "*", "*N", { desc = "Fix * (Keep the cursor position, don't move to next match)" })

map("n", "<C-Q>", ":q!<CR>", { desc = "Quit neovim" })

-- Line Movement
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map("n", "<C-j>", ":move .+1<CR>", { desc = "Move line down" })
map("n", "<C-k>", ":move .-2<CR>", { desc = "Move line up" })
map("x", "<C-j>", ":move '>+1<CR>gv=gv", { desc = "Move multiple selected line down" })
map("x", "<C-k>", ":move '<-2<CR>gv=gv", { desc = "Move multiple selected lines up" })

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>bf", ":Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy files" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

-- NeoTree
map("n", "<C-n>", ":Neotree toggle reveal_force_cwd<CR>", { desc = "Neotree toggle" })

-- Buffer Navigation
map("n", "<A-H>", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer to next" })
map("n", "<A-L>", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer to previous" })
map("n", "<A-l>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
map("n", "<A-h>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
map("n", "<A-p>", "<Cmd>BufferPin<CR>", { desc = "Pin buffer" })
map("n", "<A-c>", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
map("n", "<C-p>", "<Cmd>BufferPick<CR>", { desc = "Pick buffer" })
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", { desc = "Order buffer by language" })

-- Markdown
map("n", "<C-m>", ":MarkdownPreview<CR>", { desc = "Markdown preview" })

-- Comments
local opt = { expr = true, remap = true, replace_keycodes = false }

-- Toggle in VISUAL mode
map("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)")
map("x", "<S-y>", ":w !wl-copy<CR><CR>")
map("i", "<C-h>", "<Esc>caw", { noremap = true })

-- Spell check
map("n", "<leader>s", ":setlocal spell spelllang=en_us<CR>", { desc = "Turn on spell check" })

-- Session Manager
map("n", "<C-s>", require("auto-session.session-lens").search_session, { desc = "Project hop" })
