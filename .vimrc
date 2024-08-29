call plug#begin()

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'edkolev/tmuxline.vim'
Plug 'tomasr/molokai'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'terryma/vim-multiple-cursors'
Plug 'townk/vim-autoclose'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
let g:molokai_original = 1
let g:rehash256 = 1

let g:coc_global_extensions =
  \ [
  \ 'coc-clangd',
  \ 'coc-cmake',
  \ 'coc-sh',
  \ ]

let airline#extensions#tmuxline#snapshot_file = "~/.config/tmux/tmux-status.conf"

call plug#end()

colorscheme molokai
syntax on

set encoding=UTF-8
set softtabstop=2
set shiftwidth=2
set tabstop=2
set mouse=a

set relativenumber
set noerrorbells
set smartindent
set cursorline
set lazyredraw
set noswapfile
set autoindent
set showmatch
set expandtab
set smartcase
set nobackup
set hlsearch
set number
set nowrap

inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"

vnoremap <S-Tab> <gv
vnoremap <Tab> >gv
