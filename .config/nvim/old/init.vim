"    _   __         _    ___
"   / | / /__  ____| |  / (_)___ ___
"  /  |/ / _ \/ __ \ | / / / __ `__ \
" / /|  /  __/ /_/ / |/ / / / / / / /
"/_/ |_/\___/\____/|___/_/_/ /_/ /_/


" Ｂａｓｉｃ  Ｃｏｎｆｉｇａｒａｔｉｏｎ
" --------------------------------------
set number
set termguicolors
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
set hidden



filetype on                 " Enable type file detection. Vim will be able to try to detect the 
                            " type of file in use
filetype plugin on          " Enable plugins and load plugin for the detected file type
filetype indent on          " Load an indent file for the detected file type


" Ｐｌｕｇｉｎｓ
" --------------

call plug#begin('~/.nvim')
  
Plug 'plasticboy/vim-markdown'
Plug 'https://github.com/windwp/windline.nvim'          " Statusline
Plug 'neoclide/coc.nvim', {'branch': 'release'}	        " Auto Completion
Plug 'https://github.com/terryma/vim-multiple-cursors'  " multiple cursors
Plug 'https://github.com/preservim/tagbar'              " Tagbar for code navigation

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons'                     " for file icons
Plug 'kyazdani42/nvim-tree.lua'                         " neovimtree
Plug 'akinsho/toggleterm.nvim'

" markdown
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'elzr/vim-json'
Plug 'dkarter/bullets.vim'
Plug 'dag/vim-fish'                                      " for config.fish
Plug 'https://github.com/Raimondi/delimitMate'           " auto pair closing of quotes, parenthesis, brackets
Plug 'vimwiki/vimwiki'                                   " VimWiki

Plug 'nvim-lua/plenary.nvim'                             " for github support
Plug 'lewis6991/gitsigns.nvim'                           " for githubsupport
Plug 'projekt0n/github-nvim-theme'                       " github colorscheme
call plug#end()

"Ｃｏｌｏｒｓｃｈｅｍｅ
"-----------------------
""" Available Themes
"1) github_dark, 2) github_dimmed, 3) github_dark_default,
"4) github_dark_colorblind, 5) github_light, 6) github_light_default,
"7) github_light_colorblind 

"let g:github_comment_style = "italic"
"let g:github_keyword_style = "italic"
"let g:github_function_style = "italic"
"let g:github_variable_style = "italic"

"ｖｉｍｗｉｋｉ
"--------------

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"let g:vimwiki_list = [{'path': '~/Documents/Notes/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_list = [{'path': '~/MEGAsync/Notes/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]




"ｆｉｓｈ  ｓｙｎｔａｘ  ｈｉｇｈｌｉｇｈｔｉｎｇ
"-----------------------------------------------
highlight LineNr ctermfg=grey


"ｌｕａ  Ｃｏｍｍａｎｄｓ
"-----------------------

lua << EOF

-- Nvim Tree --
---------------
require("nvim-tree").setup()

-- Status Line --
-----------------
-- require("wlsample.airline")
require('lualine').setup()

-- Terminal --
--------------
require("toggleterm").setup{shade_terminals = false}
EOF


"Ｎｖｉｍ  Ｔｒｅｅ
"------------------
nnoremap <C-c> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
lua require ('nvimtree')


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

let g:mkdp_browser = 'surf'
let g:mkdp_auto_close = 0
nnoremap <M-m> :MarkdownPreview<CR>

let g:mkdp_filetypes = ['markdown']

" Custom CSS for Markdown Preview

let g:mkdp_refreash_slow = 1
let g:mkdp_markdown_css = '~/.config/nvim/markdowncss/markdown6.css'


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


" markdown editing
let g:UltiSnipsExpandTrigger="<c-p>"  " use <Tab> to trigger autocompletion
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:vimwiki_global_ext = 0

"ｃｔａｇ
"--------
nmap <F8> :TagbarToggle<CR>


" Ｍｏｕｓｅ  Ｃｏｎｆｉｇ
" ------------------------
set mouse=nicr
set mouse=a     " eneble mouse support
set mouse=v     " middle-click to paste with


" Ｔｅｌｅｓｃｏｐｅ
" ------------------
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"ＴｏｇｇｌｅＴｅｒｍ
"--------------------

nnoremap <M-t> :ToggleTerm<CR>
