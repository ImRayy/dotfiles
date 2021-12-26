" _ __   ___  _____   _(_)_ __ ___
"| '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"| | | |  __/ (_) \ V /| | | | | | |
"|_| |_|\___|\___/ \_/ |_|_| |_| |_|
""""""""""""""""""""""""""""""""""""

" Ｂａｓｉｃ  Ｃｏｎｆｉｇａｒａｔｉｏｎ
" --------------------------------------

set number			        " Set number row
#set relativenumber
set autoindent
set smarttab
set softtabstop=4 		
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent				" Indent a new line the same amount as the line just typed
set wildmode
set wildmode=list:longest	" Bash like tav completions
set expandtab
set nobackup



filetype on                 " Enable type file detection. Vim will be able to try to detect the -
                            " type of file in use
filetype plugin on          " Enable plugins and load plugin for the detected file type
filetype indent on          " Load an indent file for the detected file type

" Ｐｌｕｇｉｎｓ
" --------------

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'       " Status bar
Plug 'https://github.com/neoclide/coc.nvim'	            " Auto Completion
Plug 'luukvbaal/nnn.nvim'			                    " nnn filemanager
Plug 'https://github.com/terryma/vim-multiple-cursors'  " multiple cursors
Plug 'https://github.com/preservim/tagbar'              " Tagbar for code navigation

call plug#end()


" ｎｎｎ  Ｆｉｌｅｍａｎａｇｅｒ  Ｐｌｕｇｉｎ
" --------------------------------------------
lua << EOF
require("nnn").setup()
EOF

tnoremap <C-A-n> <cmd>NnnExplorer<CR>
nnoremap <C-A-n> <cmd>NnnExplorer %:p:h<CR>
tnoremap <C-A-p> <cmd>NnnPicker<CR>
nnoremap <C-A-p> <cmd>NnnPicker<CR>


nmap <F8> :TagbarToggle<CR>

" Ｍｏｕｓｅ  Ｃｏｎｆｉｇ
" ------------------------
set mouse=nicr
set mouse=a     " eneble mouse support
set mouse=v     " middle-click to paste with



" Ｎｅｏｖｉｄｅ
" --------------

let g:neovide_transparency=0.6
