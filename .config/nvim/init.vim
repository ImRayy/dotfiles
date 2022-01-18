" _ __   ___  _____   _(_)_ __ ___
"| '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"| | | |  __/ (_) \ V /| | | | | | |
"|_| |_|\___|\___/ \_/ |_|_| |_| |_|
""""""""""""""""""""""""""""""""""""

" Ｂａｓｉｃ  Ｃｏｎｆｉｇａｒａｔｉｏｎ
" --------------------------------------

set number			        " Set number row
"set relativenumber
set autoindent
set smarttab
set softtabstop=4 		
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent				" Indent a new line the same amount as the line just typed
set wildmenu                " Display all matcher when tab complete
set expandtab               " User spaces insted of tabs
set nobackup                " No auto backup
set clipboard=unnamedplus   " Copy/paste between vim and other programs
set hidden                  " Needed to keep multiple buffers open
set noswapfile

syntax enable


filetype on                 " Enable type file detection. Vim will be able to try to detect the 
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

" neovim extra
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'

call plug#end()



"Ｍａｒｋｄｏｗｎ  Ｐｒｅｖｉｅｗ
"--------------------------------

let g:mkdp_auto_close = 0
nnoremap <M-m> :MarkdownPreview<CR>

" Custom CSS for Markdown Preview

let g:mkdp_refreash_slow=1
let g:mkdp_markdown_css='~/.config/nvim/githumdformat/github-markdown.css'

" Ｍａｒｋｄｏｗｎ  Ｓｙｎｔｅｘ  Ｈｉｇｈｌｉｇｈｔｉｎｇ
" -------------------------------------------------------

let g:vim_markdown_folding_disabled = 1     " Disable header folding

let g:vim_markdown_conceal = 0              " Do not use conceal feature, bad implimentation

" disable math tex conceal feature
let g:tex_conceal = ""                      
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1          " for YAML format
let g:vim_markdown_toml_frontmatter = 1     " for TOML format
let g:vim_markdown_json_frontmatter = 1     " for



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


" Markdown
let g:mkdp_refreash_slow=1
let g:mkdp_markdown_css='~/.config/nvim/githumdformat/github-markdown.css'


" Ｎｅｏｖｉｄｅ
" --------------

let g:neovide_transparency=0.6
