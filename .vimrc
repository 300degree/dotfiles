call plug#begin()

Plug 'tomasr/molokai'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ryanoasis/vim-devicons'

call plug#end()

colorscheme molokai
syntax on
set encoding=UTF-8
set relativenumber
set autoindent
set tabstop=2
set mouse=a
set number

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
