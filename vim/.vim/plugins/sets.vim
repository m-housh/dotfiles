
" Settings:
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set nohlsearch
set hidden
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set colorcolumn=80
set noerrorbells
set number
syntax enable
set background=dark

let mapleader = " "


fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup MICHAEL
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END


