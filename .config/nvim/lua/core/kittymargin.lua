-- set kitty margin and padding to 0 while using neovim
-- nomore kitty and neovim colorscheme conflict

vim.cmd ([[
augroup kitty_mp
    autocmd!
    au VimLeave * :silent !kitty @ set-spacing padding=10 margin=10
    au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
augroup END
]])
