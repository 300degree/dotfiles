call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'edkolev/tmuxline.vim'
Plug 'preservim/nerdtree'
Plug 'tomasr/molokai'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
" Plug 'townk/vim-autoclose'

call plug#end()

colorscheme molokai
syntax on

set encoding=UTF-8
set softtabstop=2
set shiftwidth=2
set tabstop=2
set mouse=a

set relativenumber
set smartindent
set cursorline
set lazyredraw
set noswapfile
set autoindent
set showmatch
set expandtab
set smartcase
set nobackup
set number
set nowrap

inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>

" coc language server
" add to coc_global_extensions, if you wanna using it.
" coc-html, coc-css
" coc-tserver
" coc-json
" coc-pyright
" coc-java

" let g:coc_global_extensions = ['coc-clangd', 'coc-go', 'coc-golines', 'coc-sh']
let g:coc_global_extensions = ['coc-clangd', 'coc-pyright']
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeDirArrowExpandable="+"

