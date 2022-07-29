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
set emoji
set hidden
filetype on                 " Enable type file detection. Vim will be able to try to detect the 
                            " type of file in use
filetype plugin on          " Enable plugins and load plugin for the detected file type
filetype indent on          " Load an indent file for the detected file type


" Ｐｌｕｇｉｎｓ
" --------------

call plug#begin('~/.nvim')
  
" ==================== GUI Stuff ==================== "
Plug 'plasticboy/vim-markdown'
Plug 'nvim-lualine/lualine.nvim'                            " Statusline
Plug 'kyazdani42/nvim-web-devicons'                         " for file icons
Plug 'junegunn/goyo.vim'                                    " goyo
Plug 'projekt0n/github-nvim-theme'                          " github colorscheme
Plug 'psliwka/vim-smoothie'                                 " smooth scrolling
Plug 'kyazdani42/nvim-tree.lua'                             " file explorar
Plug 'goolord/alpha-nvim'                                   " startup screen
" ================= Functionalities ================= "

"markdown
Plug 'vimwiki/vimwiki'                                      
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
Plug 'plasticboy/vim-markdown'                              

"autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}	            " Auto Completion
Plug 'dkarter/bullets.vim'                                  " auto bullets for list
Plug 'https://github.com/Raimondi/delimitMate'              " auto pair closing of quotes, parenthesis, brackets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"visual
Plug 'https://github.com/terryma/vim-multiple-cursors'      " multiple cursors
Plug 'https://github.com/preservim/tagbar'                  " Tagbar for code navigation
Plug 'dag/vim-fish'                                         " for config.fish
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }    " highlighting for python

"github
Plug 'nvim-lua/plenary.nvim'                                " for github support
Plug 'lewis6991/gitsigns.nvim'                              " for githubsupport

"others
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'

call plug#end()



"Ｃｏｌｏｒｓｃｈｅｍｅ
"-----------------------

" ================= Available Themes ================ "

"1) github_dark, 2) github_dimmed, 3) github_dark_default,
"4) github_dark_colorblind, 5) github_light, 6) github_light_default,
"7) github_light_colorblind 

colorscheme github_dark

let g:github_comment_style = "italic"
let g:github_keyword_style = "italic"
let g:github_function_style = "italic"
let g:github_variable_style = "italic"


"ｖｉｍｗｉｋｉ
"--------------

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/MEGAsync/Notes/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]



"ｆｉｓｈ  ｓｙｎｔａｘ  ｈｉｇｈｌｉｇｈｔｉｎｇ
"-----------------------------------------------
highlight LineNr ctermfg=grey


"ｌｕａ  Ｃｏｍｍａｎｄｓ
"-----------------------

lua << EOF

-- Status Line --
-----------------
-- require("wlsample.airline")
require('lualine').setup()


-- Terminal --
--------------
require("toggleterm").setup{shade_terminals = false}


-- startup.nvim -- 
------------------
 -- require("plugins.config.alpha")
require("plugins.config.alpha")
require("nvim-tree").setup()
require("plugins.config.nvimtree")
--require("core.utils")
require("core.keybindings")
--require("plugins.config.others")

EOF


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


nnoremap <C-c> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
"Ｍａｒｋｄｏｗｎ  Ｐｒｅｖｉｅｗ
"--------------------------------

let g:mkdp_browser = "chromium"
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
nnoremap <leader>cc <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
