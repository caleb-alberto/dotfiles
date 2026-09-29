set guicursor=
set number
set relativenumber

set tabstop=8
set softtabstop=8
set shiftwidth=8
set expandtab
set smartindent

set wrap

set noswapfile
set nobackup

set nohlsearch
set incsearch

let mapleader = " "

nnoremap <leader>pv :Ex<CR>
vnoremap <leader>y "+y
nnoremap S ^C

set laststatus=2
set statusline=
set statusline+=%f\ %m
set statusline+=%=
set statusline+=%l,%c\ \ %P

highlight Normal ctermfg=white ctermbg=none
highlight LineNr ctermfg=white ctermbg=none
highlight Visual ctermfg=black ctermbg=white
highlight StatusLine cterm=NONE ctermfg=white ctermbg=none
highlight StatusLineNC cterm=NONE ctermfg=white ctermbg=none
set background=dark
