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
set cmdheight=4
set ttimeoutlen=0
set nofoldenable

set nocompatible
filetype off
syntax on

let mapleader = ','
let g:netrw_banner = 0

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
Plugin 'rodjek/vim-puppet'
Plugin 'chriskempson/base16-vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'antoinemadec/FixCursorHold.nvim'
Plugin 'lambdalisue/fern.vim'
Plugin 'liuchengxu/vista.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'dense-analysis/ale'
Plugin 'alaviss/nim.nvim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on

" Color Scheme
set termguicolors
colorscheme base16-default-dark

" Fzf
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
nnoremap <silent> <Leader>f :Find<CR>
nnoremap <silent> <Leader>p :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" Fern
noremap <silent> <Leader>\ :Fern . -drawer -toggle -reveal=%<CR>

" Vista
noremap <silent> <Leader>] :Vista!!<CR>

" Tcomment
noremap <silent> <Leader>/ :TComment<CR>

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'nim': ['nimlsp', 'nimcheck'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'nim': ['nimpretty'],
\}
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚠⚠'
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yell

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
let g:airline_theme='ayu_mirage'
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

let javascript_sql_dialect='sql'
