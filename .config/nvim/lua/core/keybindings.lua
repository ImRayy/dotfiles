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

-- Bufferline
map ('n', '<S-l>',':BufferLineCycleNext<CR>')
map ('n', '<S-h>',':BufferLineCyclePrev<CR>')

-- Code format with null-ls
map ('n', '<C-f>', ':lua vim.lsp.buf.format{async = true}<CR>')

-- Markdown Previews
map ('n', '<C-m>', ':MarkdownPreview<CR>')

-- Comments

local opt = {expr = true, remap = true, replace_keycodes = false}

-- Toggle using count
map('n', 'gcc', "v:count == 0 ? '<Plug>(comment_toggle_linewise_current)' : '<Plug>(comment_toggle_linewise_count)'", opt)

-- Toggle in VISUAL mode
map('x', '<C-/>', '<Plug>(comment_toggle_linewise_visual)')

map('x', '<S-y>', ':w !wl-copy<CR><CR>')

map('x', '<Leader>f', ':lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({}))<CR>')
