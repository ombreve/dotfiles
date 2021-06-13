" Vim minimal configuration file

set nocompatible

filetype plugin indent on

set encoding=utf-8
set spelllang=fr,en

set backspace=indent,eol,start
set nobackup

set autoindent
set shiftwidth=2
set shiftround
set textwidth=0

set ignorecase
set smartcase
set incsearch

set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set ruler
set display=lastline
set wildmenu
set visualbell

set background=dark
let loaded_matchparen = 1

nnoremap <C-J> <C-w>w
nnoremap <C-K> <C-w>W
inoremap <C-U> <C-G>u<C-U>

autocmd FileType text setl tw=66
autocmd FileType c,cpp setl et nu sts=4 sw=4 tw=80

let g:grammalecte_cli_py='$HOME/.local/lib/Grammalecte-fr-v2/grammalecte-cli.py'
let g:grammalecte_disable_rules =
\   'nbsp_avant_double_ponctuation nbsp_avant_deux_points '
\ . 'nbsp_après_chevrons_ouvrants nbsp_avant_chevrons_fermants1 '
\ . 'nbsp_après_tiret1 '
\ . 'apostrophe_typographique apostrophe_typographique_après_t'

