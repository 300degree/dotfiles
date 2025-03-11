call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.local/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'

call plug#end()

set t_Co=256
set termguicolors
set background=dark
colorscheme gruvbox
syntax on

" Filetype and indent {
filetype plugin on
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
" }

" General settings {
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
" }

" KeyMapping {
" command! Format LspDocumentFormat
" command! FormatSync LspDocumentFormatSync

let mapleader=','
let g:mapleader=','

nnoremap <leader>w :W<CR>
nnoremap <leader>p :Files<CR>
" nnoremap <leader>fm :Format<CR>
" nnoremap <leader>fms :FormatSync<CR>

vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <TAB> pumvisible() ? asyncomplete#close_popup() : "\<TAB>"
" }

" NerdCommenter settings {
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }
let g:NERDCommentEmptyLines = 1
" }

" AirLine settings {
" let g:airline_section_a = ''
" let g:airline_section_b = ''
" let g:airline_section_c = ''
" let g:airline_section_x = ''
" let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'
" }

" Lsp settings {
" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"     \ 'name': 'clangd',
"     \ 'cmd': {server_info->['clangd']},
"     \ 'allowlist': ['c', 'cpp']
"     \ })
" endif
" 
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"     \ 'name': 'pyls',
"     \ 'cmd': {server_info->['pyls']},
"     \ 'allowlist': ['python'],
"     \ })
" endif
" 
" autocmd FileType c,cpp let g:asyncomplete_enable = 1
" let g:lsp_settings = {
"     \ 'clangd': {
"         \ 'cmd': ['clangd', '--background-index', '--completion-style=detailed', '--header-insertion=never'],
"         \ 'filetypes': ['c', 'cpp'],
"     \ }
" \ }
" }
