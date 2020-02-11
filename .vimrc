" My Vim Configuration
"
set showmode
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
" set hidden
set number relativenumber
set updatetime=250

set nocompatible
filetype off
syntax on

" Leader Key
let mapleader = ','

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins')
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tomtom/tcomment_vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ayu-theme/ayu-vim'
Plugin 'prettier/vim-prettier'
Plugin 'zah/nim.vim'
Plugin 'rodjek/vim-puppet'

call vundle#end()
filetype plugin indent on

" Color Scheme
set termguicolors
let ayucolor = "mirage"
colorscheme ayu

" netrw
let g:netrw_winsize = -28
let g:netrw_liststyle = 3 " Tree View
let g:netrw_browse_split = 3 " Open file in new tab

" Tcomment
noremap <silent> <Leader>/ :TComment<CR>

" CtrlP
noremap <silent> <Leader>p :CtrlP<CR>

" Lightline
" set laststatus=2
" set noshowmode

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_nim_checkers = ['nim']

" Airline Theme
let g:airline_theme='ayu_mirage'
let g:airline_powerline_fonts = 1

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue :PrettierAsync

" Consider node_modules to be in PATH
let $PATH = system('yarn bin')[:-2] . ':' . $PATH

" Force .nim files to filestype=nim and syntax=nim
au BufNewFile,BufRead,BufReadPost *.nim set syntax=nim filetype=nim

" Force syntax highlighting for puppet files
au BufNewFile,BufRead,BufReadPost *.pp set syntax=puppet filetype=puppet
au BufNewFile,BufRead,BufReadPost Puppetfile set syntax=puppet filetype=puppet
