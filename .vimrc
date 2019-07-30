"                 |
" Plug.vim stuffs v
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-abolish'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
call plug#end() 

set nocompatible
syntax on
set background=dark
colorscheme solarized

set backspace=indent,eol,start

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set numberwidth=5

nnoremap √ :NERDTreeToggle<CR>

set wildmenu

set ruler
set showcmd

set incsearch
set hlsearch

set cursorline

set softtabstop=2
set tabstop=2  
set shiftwidth=2

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
