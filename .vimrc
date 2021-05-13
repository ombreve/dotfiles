" Vim configuration file

set nocompatible

filetype plugin indent on

set autoindent
set background=dark
set backspace=indent,eol,start
set encoding=utf-8
set ignorecase
set incsearch
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set modeline
set modelines=5
set nobackup
set ruler
set shiftround
set shiftwidth=2
set smartcase
set spelllang=fr,en
set textwidth=77
set visualbell
set wildmenu

inoremap <C-U> <C-G>u<C-U>

autocmd FileType c,cpp setl et sts=4 sw=4 tw=80

let g:grammalecte_cli_py='$HOME/.local/lib/Grammalecte-fr-v2/grammalecte-cli.py'
let g:grammalecte_disable_rules =
\   'nbsp_avant_double_ponctuation nbsp_avant_deux_points '
\ . 'nbsp_après_chevrons_ouvrants nbsp_avant_chevrons_fermants1 '
\ . 'nbsp_après_tiret1 '
\ . 'apostrophe_typographique apostrophe_typographique_après_t'

