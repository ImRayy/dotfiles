local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', ':update<CR>')
map('n', '<leader>W', ':wall<CR>')

-- Quit neovim
map('n', '<C-Q>', ':q!<CR>')

-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', ':move .+1<CR>')
map('n', '<C-k>', ':move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- telescope
map ('n', '<leader>ff', ':Telescope find_files<CR>')
map ('n', '<leader>bf', ':Telescope live_grep<CR>')
map ('n', '<leader>fb', ':Telescope buffers<CR>')
map ('n', '<leader>fh', ':Telescope help_tags<CR>')

-- Neotree
map ('n', '<C-n>', ':Neotree toggle reveal_force_cwd<CR>')
