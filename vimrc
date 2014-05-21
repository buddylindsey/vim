execute pathogen#infect()

let mapleader = ","
let maplocalleader = "\\"

" basics
set nocompatible              " Use vim defaults
set ruler                     " Show the cursor position all the time
set title                     " Show title in console title bar
set hid                       " Change buffer without saving
set showmatch                 " Show matching bracets
set number   " show line numbers
set relativenumber
set directory=~/.vim/swapfiles
set backspace=indent,eol,start
set fileformats=unix,mac,dos
set cursorline
set scrolloff=3
set showcmd
set term=screen-256color
set pastetoggle=<F3>
set incsearch

" sets syntax highlighting and color shceme
syntax on " syntax highlighting on

set background=dark
colorscheme neverland

" status line
set statusline=%{fugitive#statusline()}%F%m-%r[%L][%p%%][%{&ff}]%y[%l,%v]

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

" PHP
autocmd FileType php set shiftwidth=4
autocmd FileType php set softtabstop=4
autocmd FileType php set tabstop=4
autocmd FileType php set noexpandtab
autocmd FileType php set noeol
autocmd FileType php set binary

autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

set list
set listchars=tab:.\ ,extends:>,precedes:<,trail:·

" Buddy Remapping
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:udpate<CR>
inoremap <silent> <C-s> <C-O>:update<CR>

" --Keyboard mappings--
" vim file specific
map <Leader>v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map <Leader>u :source ~/.vimrc<cr>
map <Leader>e :e ~/.vimrc<cr>

" vimwiki
"nmap <Leader>ii <Plug>VimwikiIndex
"nmap <Leader>it <Plug>VimwikiTabIndex
"nmap <Leader>is <Plug>VimwikiUISelect
"nmap <Leader>id <Plug>VimwikiDiaryIndex
"nmap <Leader>i<Leader>i <Plug>VimwikiDiaryGenerateLinks
"nmap <Leader>i<Leader>w <Plug>VimwikiMakeDiaryNote
"nmap <Leader>i<Leader>t <Plug>VimwikiTabMakeDiaryNote
"nmap <buffer> <Leader>ihh <Plug>Vimwiki2HTMLBrowse
"nmap <buffer> <Leader>ih <Plug>Vimwiki2HTML
"nmap <silent><buffer> <Leader>ir <Plug>VimwikiRenameLink
"nmap <silent><buffer> <Leader>id <Plug>VimwikiDeleteLink
"let wiki = {}
"let wiki.nested_syntaxes = {'cs': 'coffee'}
"let g:vimwiki_list = [wiki]

" Turns off top bar in macvim
if has("gui_running")
  set guioptions=egmrt
endif

" [p]roject drawer
nnoremap <silent> <Leader>p :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.sock$']

" yankring bindings
nnoremap <silent> <F11> :YRShow<CR>
map <Leader>; :YRShow<cr> " allow ,y to open yankring
let g:yankring_history_dir = '~/.vim/artifacts'
let g:yankring_history_file = 'yankring_history.txt'

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Python checking
function ToolGrep(tool)
  set lazyredraw
  " Close any existing cwindows.
  cclose
  let l:grepformat_save = &grepformat
  let l:grepprogram_save = &grepprg
  set grepformat&vim
  set grepformat&vim
  let &grepformat = '%f:%l:%m'
  if a:tool == "pylint"
    let &grepprg = 'pylint --output-format=parseable --reports=n'
  elseif a:tool == "pyflakes"
    let &grepprg = 'pyflakes'
  elseif a:tool == "pychecker"
    let &grepprg = 'pychecker --quiet -q'
  elseif a:tool == "pep8"
    let &grepprg = 'pep8 -r'
  elseif a:tool == "flake8"
    let &grepprg = 'flake8'
  else
    echohl WarningMsg
    echo "ToolGrep Error: Unknown Tool"
    echohl none
  endif
  if &readonly == 0 | update | endif
  silent! grep! %
  let &grepformat = l:grepformat_save
  let &grepprg = l:grepprogram_save
  let l:mod_total = 0
  let l:win_count = 1
  " Determine correct window height
  windo let l:win_count = l:win_count + 1
  if l:win_count <= 2 | let l:win_count = 4 | endif
  windo let l:mod_total = l:mod_total + winheight(0)/l:win_count |
        \ execute 'resize +'.l:mod_total
  " Open cwindow
  execute 'belowright copen '.l:mod_total
  nnoremap <buffer> <silent> c :cclose<CR>
  set nolazyredraw
  redraw!
endfunction

" snipmate configuration
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['python'] = 'python,django,cbv'
let g:snipMate.scope_aliases['html'] = 'html,htmldjango'
let g:snipMate.scope_aliases['jinja'] = 'html,htmldjango'
