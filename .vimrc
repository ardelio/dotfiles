runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
set background=light

colorscheme solarized
let g:solarized_termtrans = 1

set backupcopy=yes
set ls=2
set hlsearch
set incsearch
set ruler
set ignorecase
set number
set visualbell

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab 

set list
set list listchars=tab:»·,trail:·

" Enable Vim Ruby
set nocompatible
syntax on
filetype plugin indent on
" END

if has('macunix')
  set guifont=Menlo:h13
elseif has('unix')
  set guifont=Ubuntu\ Mono\ 13
endif

autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

" Removes trailing spaces
function TrimWhiteSpace()
    %s/\s*$//
    ''
:endfunction

" Attempts to auto fix formatting across whole file
function FixFormatting()
    
    ''
:endfunction

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

map <F3> :nohl<CR>
map! <F3> :nohl<CR>

map <F4> :set invnumber<CR>
map! <F4> :set invnumber<CR>

if has("gui_running")
    set guioptions=egmrt
endif

command! Tidy :exec ":%! tidy -xml -i -q"

let g:Powerline_symbols = 'fancy'

" Tab mappings
nnoremap <C-Left> :tabprevious<CR>
nnoremap tp :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap tn :tabnext<CR>
nnoremap <silent> <S-C-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-C-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
:nnoremap tc :tabclose<CR>

" NerdTree
nnoremap nt :NERDTreeToggle<CR>

autocmd filetype make setlocal noexpandtab
