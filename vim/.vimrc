
" Settings:
set tabstop=2
set softtabstop=2
set shiftwidth=2
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

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
" Plug 'morhetz/gruvbox'
call plug#end()


highlight Normal guibg=none

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


