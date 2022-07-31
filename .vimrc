set nocompatible
set noswapfile

set number

set tabstop=2
set shiftwidth=2
set smartindent

set scrolloff=16

map <F2> :w<CR>
map <F3> :tabnew 
map <F4> :!make<CR>
map <F9> :tabdo wq<CR>

filetype on
filetype indent on
filetype plugin on
syntax on

set incsearch
set ignorecase
set smartcase
set hlsearch

set wildmenu

set background=light

set listchars=tab:-\ ,trail:-
set list
