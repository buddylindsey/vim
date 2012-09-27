let mapleader = ","
let maplocalleader = "\\"

" basics
set nocompatible              " Use vim defaults
set ruler                     " Show the cursor position all the time
set title                     " Show title in console title bar
set hid                       " Change buffer without saving
set showmatch                 " Show matching bracets
set number		" show line numbers
set directory=~/.vim/swapfiles
set backspace=indent,eol,start
set fileformats=unix,mac,dos
set cursorline
set scrolloff=3
set showcmd

" sets syntax highlighting and color shceme
syntax on			" syntax highlighting on

set background=dark
colorscheme solarized 

" status line
set statusline=%F%m-%r[%L][%p%%][%{&ff}]%y[%l,%v]

" Indentation
filetype plugin indent on
set expandtab
set formatoptions=rq
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set smarttab

" Python
autocmd FileType python set shiftwidth=4 
autocmd FileType python set softtabstop=4
autocmd FileType python set tabstop=8 

" Turns off top bar in macvim
if has("gui_running")
  set guioptions=egmrt
endif

" --Keyboard mappings--
" vim file specific
map <Leader>v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map <Leader>u :source ~/.vimrc<cr>
map <Leader>e :e ~/.vimrc<cr>

" yankring bindings
nnoremap <silent> <F11> :YRShow<CR>
map <Leader>y :YRShow<cr> " allow ,y to open yankring
