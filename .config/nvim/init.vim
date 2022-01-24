"    _   __         _    ___
"   / | / /__  ____| |  / (_)___ ___
"  /  |/ / _ \/ __ \ | / / / __ `__ \
" / /|  /  __/ /_/ / |/ / / / / / / /
"/_/ |_/\___/\____/|___/_/_/ /_/ /_/



" Ｂａｓｉｃ  Ｃｏｎｆｉｇａｒａｔｉｏｎ
" --------------------------------------
set termguicolors
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

call plug#begin('~/.nvim')

Plug 'feline-nvim/feline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}	        " Auto Completion
Plug 'https://github.com/terryma/vim-multiple-cursors'  " multiple cursors
Plug 'https://github.com/preservim/tagbar'              " Tagbar for code navigation



Plug 'kyazdani42/nvim-web-devicons'                     " for file icons
Plug 'kyazdani42/nvim-tree.lua'                         " neovimtree (alternative of nerd-tree written in lua

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" tabular plugin is used to format tables
Plug 'godlygeek/tabular'
" JSON front matter highlight plugin
Plug 'elzr/vim-json'
Plug 'dag/vim-fish'                                      " for config.fish
Plug 'https://github.com/Raimondi/delimitMate'           " auto pair closing of quotes, parenthesis, brackets

call plug#end()



"ｆｉｓｈ  ｓｙｎｔａｘ  ｈｉｇｈｌｉｇｈｔｉｎｇ
"-----------------------------------------------
highlight LineNr ctermfg=grey


"ｎｖｉｍ－ｔｒｅｅ
"------------------

lua << EOF
require("nvim-tree").setup()
require("feline").setup()
EOF

"key bindings
nnoremap <C-c> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"theming
"highlight NvimTreeFolderIcon guibg=blue



"Ａｕｔｏｃｏｍｐｌｅｔｅ  （ｃｏｃ．ｎｖｉｍ）
"---------------------------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



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


"ｃｔａｇ
"--------
nmap <F8> :TagbarToggle<CR>


" Ｍｏｕｓｅ  Ｃｏｎｆｉｇ
" ------------------------
set mouse=nicr
set mouse=a     " eneble mouse support
set mouse=v     " middle-click to paste with


" Ｎｅｏｖｉｄｅ
" --------------
let g:neovide_transparency=0.6

