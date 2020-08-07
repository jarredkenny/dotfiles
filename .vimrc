set showmode
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set number relativenumber
set updatetime=250
set mouse=a

set nocompatible
filetype off
syntax on

let mapleader = ','

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins')
Plugin 'VundleVim/Vundle.vim'

Plugin 'tomtom/tcomment_vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'prettier/vim-prettier'
Plugin 'zah/nim.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'chriskempson/base16-vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

" Color Scheme
set termguicolors
colorscheme base16-tomorrow-night

" Fzf
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
nnoremap <silent> <Leader>f :Find<CR>
nnoremap <silent> <Leader>p :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" Tcomment
noremap <silent> <Leader>/ :TComment<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map={'mode': 'passive'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_nim_checkers = ['nim']

" Airline Theme
let g:airline_theme='base16_tomorrow'
let g:airline_powerline_fonts = 1

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue :PrettierAsync

" Consider node_modules to be in PATH
let $PATH = system('yarn bin')[:-2] . ':' . $PATH

" Nim
au BufNewFile,BufRead,BufReadPost *.nim set syntax=nim filetype=nim

" Puppet
au BufNewFile,BufRead,BufReadPost *.pp set syntax=puppet filetype=puppet
au BufNewFile,BufRead,BufReadPost Puppetfile set syntax=puppet filetype=puppeti

