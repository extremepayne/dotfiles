"                 |
" Plug.vim stuffs v
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-abolish'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'tpope/vim-rails'
" Plug 'slim-template/vim-slim'
call plug#end()

set nocompatible
syntax on
set background=dark
colorscheme solarized

set encoding=utf-8

set nowrap

set backspace=indent,eol,start

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set numberwidth=5


set cmdheight=2
set updatetime=300
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')


" source: https://stackoverflow.com/a/24046914/2571881
let s:comment_map = {
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "zsh": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "zshrc": '#',
    \   "zsh_profile": '#',
    \   "vim": '"',
    \   "slim": '\/',
    \ }
function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
		if getline('.') =~ '\v^\s*' . comment_leader
            " Uncomment the line
            execute 'silent s/\v\s*\zs' . comment_leader . '\s*\ze//'
        else
            execute 'silent s/\v^(\s*)/\1' . comment_leader . ' /'
        endif
    else
        echo "No comment leader found for filetype"
    endif
endfunction

nnoremap <C-_> :call ToggleComment()<CR>
vnoremap <C-_> :call ToggleComment()<CR>

set wildmenu
set wildmode=longest:full,full

set ruler
set showcmd
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitStatus()
  if system("git diff") != ""
    return 0 " working tree clean
  else
    return 1 " working tree dirty
  endif
endfunction

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'   '.l:branchname.' ':''
endfunction

function! ShortPath()
  return pathshorten(bufname("%"))
endfunction
set laststatus=2

set statusline=
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=%{StatuslineGit()}
set statusline+=
set statusline+=\ %{ShortPath()}
set statusline+=\ 
set statusline+=%m
" seperator from right to left
set statusline+=%=
set statusline+=
set statusline+=\ %y

set incsearch
set hlsearch

set cursorline

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

let g:vue_pre_processors = []

nnoremap <C-p> :Files<Cr>
noremap <Left>  :echoe "Use h"<CR>
noremap <Right> :echoe "Use l"<CR>
noremap <Up>    :echoe "Use k"<CR>
noremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <Esc>:echoe "Use h"<CR>
inoremap <Right> <Esc>:echoe "Use l"<CR>
inoremap <Up>    <Esc>:echoe "Use k"<CR>
inoremap <Down>  <Esc>:echoe "Use j"<CR>
