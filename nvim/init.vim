" Plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

let mapleader=","
let g:deoplete#enable_at_startup=1
let g:neotex_enabled=2
" let g:neotex_latexdiff=1
" let g:neotex_latexdiff_options="-t CTRADITIONAL"

" GUI
set number
set cursorline
set termguicolors
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox
set colorcolumn=80
nnoremap <leader><space> :nohlsearch<CR>
set mouse=a

" Spaces
" Use 4 spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Utilities
set clipboard=unnamedplus

" Filetypes
" Python
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewfile,BufRead *.tex:
    \ set textwidth=79

