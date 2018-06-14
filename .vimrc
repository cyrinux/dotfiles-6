" [ GVIM options ]
set guifont=IBM\ Plex\ Mono\ 12
set guioptions=i

" [ PLUGIN - Vundle ]
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomlion/vim-solidity'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

" [ COLORS ]
let python_highlight_all=1
syntax on " colors highlight
set colorcolumn=80 " vertical column
colorscheme zenburn
" mark BadWhitespace with red
highlight BadWhitespace ctermbg=red guibg=darkred
" highlight LineNr ctermfg=white ctermbg=black

" [ SPACES ]
" Use 4 spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" [ UI ]
set number " show rows numbers
set showcmd " show current command
"set cursorline " highlight current line
filetype indent on " indent rules for file types
set wildmenu " graphical menu when cycling with tab
set lazyredraw " prevent screen redraw for faster macros
"set showmatch " highlight matching parenthesis


" [ SEARCHING ]
set incsearch " search while typing
set hlsearch " highlight matches
nnoremap <leader><space> :nohlsearch<CR> " turn off hightlight with ,<space>


" [ FOLDING ]
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za " use <space> to toggle fold
set foldmethod=indent


" [ MISC ]
set encoding=utf-8
set nrformats= " disable octal literals
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set clipboard=unnamedplus
nmap <leader>ne :NERDTree<cr>
set backupcopy=yes

" [ YouCompleteMe Plugin ]
" hide suggestion tooltip
let g:ycm_autoclose_preview_window_after_completion=1
" <space>g to goto definition/declaration
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" [ Filetypes ]
" Python
au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js:
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Virtualenv support (autocomplete if vim running inside a venv)
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" Mark bad extra whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
