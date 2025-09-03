if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")

Plug 'junegunn/fzf', {
    \ 'dir': '~/.opt/fzf',
    \ 'do': './install --all'
    \ }
Plug 'junegunn/fzf.vim'

Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'

Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'

call plug#end()

" --- General ---
syntax on
set backspace=indent,eol,start
set completeopt=menuone,noinsert,noselect
set encoding=utf-8
set hlsearch
set laststatus=2
set mouse=a
set nobackup
set noerrorbells
set noshowmode
set noswapfile
set number
set relativenumber
set showmatch
set smartcase
set tags=./tags;/

" --- Indent ---
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent

" --- Colorscheme ---
if !has('gui_running')
    set t_Co=256
endif

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" --- Cursorline ---
set cursorline
hi CursorLine cterm=NONE ctermbg=BLACK ctermfg=NONE

" --- Keybind ---
let mapleader=','
nnoremap <leader>p :Files<CR>
nnoremap <leader>t :TagbarToggle<CR>
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

let g:NERDSpaceDelims       = 1
let g:NERDCompactSexyComs   = 1
let g:NERDDefaultAlign      = 'left'
let g:NERDAltDelims_java    = 1
let g:NERDCustomDelimiters  = { 'c': { 'left': '/*','right': '/'  }  }
let g:NERDCommentEmptyLines = 1

let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ }
    \ } 
