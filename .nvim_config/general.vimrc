syntax on
filetype plugin indent on

set background=dark
colorscheme hybrid

let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'
let g:deoplete#enable_at_startup = 1

let mapleader=" "
set t_Co=256
set incsearch
set autoindent
set linebreak
set backspace=indent,eol,start
set number
set ignorecase
set relativenumber
set autoread
set noreadonly
set splitright
set splitbelow
set cursorline
"set cursorcolumn
set colorcolumn=100
"highlight ColorColumn ctermbg=0 guibg=lightgrey
set backup
set history=1000
set backupdir=$HOME/.vim-backup
set undodir=$HOME/.vim-undo
set viewdir=$HOME/.vim-views
set directory=$HOME/.vim-swap
set tabstop=2
set shiftwidth=2
set expandtab
