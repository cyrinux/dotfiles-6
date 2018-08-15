function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

" Plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomlion/vim-solidity'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'lambdalisue/suda.vim' " sudo edit/open files
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
call plug#end()

let mapleader=","
let g:deoplete#enable_at_startup=1
let g:neotex_enabled=2
let g:neotex_subfile=1
" let g:neotex_latexdiff=1
" let g:neotex_latexdiff_options="-t CTRADITIONAL"

" GUI
set number
set cursorline
set termguicolors
colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1
hi Normal guibg=NONE ctermbg=NONE
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
set title " append - NVIM to the window title
set spelllang=en,it
set splitbelow
set splitright
set clipboard=unnamedplus
let g:tex_flavor = "latex" " disambiguate .tex files to latex
let g:ale_linters_ignore = { 'tex': ['lacheck'] }

" Filetypes
" Hide row numbers in terminal
au TermOpen * setlocal nonumber norelativenumber
au TermOpen * startinsert

" Javascript
au FileType javascript setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Python
au FileType python setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4

au FileType tex setlocal
    \ spell
    \ textwidth=79
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au FileType markdown setlocal
    \ spell
    \ textwidth=79

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

" STOP using arrow keys!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
