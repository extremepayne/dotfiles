"                 |
" Plug.vim stuffs v
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-abolish'
Plug 'lifepillar/vim-solarized8'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
" Plug 'preservim/vim-markdown'
call plug#end()

set nocompatible
syntax on
set background=dark
let g:solarized_termtrans=1
let g:solarized_use16=1
colorscheme solarized8

set encoding=utf-8

set nowrap

set backspace=indent,eol,start

nnoremap <SPACE> <Nop>

let mapleader=" "

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

nnoremap <silent> <Leader>ft :FloatermToggle<CR>
nnoremap <silent> <Leader>tt :NvimTreeToggle<CR>

" coc.nvim tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)


let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_disabled = 1

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set numberwidth=5

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

set updatetime=500

set title

set incsearch
set hlsearch

set cursorline

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

nnoremap <C-p> :Files<Cr>

lua << EOF

-- empty setup using defaults
require("nvim-tree").setup()
EOF

