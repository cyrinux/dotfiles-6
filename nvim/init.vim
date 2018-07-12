" Plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomlion/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dbeniamine/cheat.sh-vim'
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
set autoindent

" Utilities
set splitbelow
set splitright
set clipboard=unnamedplus

" Filetypes
" Hide row numbers in terminal
au TermOpen * setlocal nonumber norelativenumber
au TermOpen * startinsert

" Javascript
au FileType javascript:
    \ setlocal tabstop=2
    \ setlocal softtabstop=2
    \ setlocal shiftwidth=2

" Python
au BufNewFile,BufRead python:
    \ setlocal tabstop=4
    \ setlocal softtabstop=4
    \ setlocal shiftwidth=4

au BufNewfile,BufRead *.tex:
    \ set textwidth=79

" Workspace Setup
" ----------------
function! DefaultWorkspace()
    let width = winwidth(0)
    Explore
    vsp
    sp
    term
    resize 10
    wincmd k
    wincmd h
    vertical resize 20
    wincmd l
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()
