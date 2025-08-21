if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync
endif

call plug#begin("~/.vim/plugged")

Plug 'junegunn/fzf', { 'dir': '~/.opt/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'

call plug#end()

set t_Co=256
set termguicolors
set background=dark
colorscheme gruvbox
syntax on

filetype plugin on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent

set encoding=utf-8
set mouse=a
set relativenumber
set number
set hlsearch
set smartcase
set showmatch
set backspace=indent,eol,start
set noerrorbells
set noshowmode
set noswapfile
set nobackup
set completeopt=menuone,noinsert,noselect

" command! Format LspDocumentFormat
" command! FormatSync LspDocumentFormatSync

let mapleader=','
let g:mapleader=','

nnoremap <leader>w :W<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>t :TagbarToggle<CR>
" nnoremap <leader>fm :Format<CR>
" nnoremap <leader>fms :FormatSync<CR>

vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" inoremap <expr> <TAB> pumvisible() ? asyncomplete#close_popup() : "\<TAB>"

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }
let g:NERDCommentEmptyLines = 1

set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'powerline', 
            \ }

 " if executable('clangd')
     " au User lsp_setup call lsp#register_server({
     " \ 'name': 'clangd',
     " \ 'cmd': {server_info->['clangd']},
     " \ 'allowlist': ['c', 'cpp', 'cuda']
     " \ })
 " endif
 " autocmd FileType c,cpp let g:asyncomplete_enable = 1
 " let g:lsp_settings = {
     " \ 'clangd': {
         " \ 'cmd': ['clangd', '--background-index', '--completion-style=detailed', '--header-insertion=never'],
         " \ 'filetypes': ['c', 'cpp', 'cuda'],
     " \ }
 " \ }
