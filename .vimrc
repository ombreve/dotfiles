" Section: Bootstrap

if v:version < 800 | finish | endif
if $VIM_BARE | set noloadplugins | finish | endif

set nocompatible
set pastetoggle=<F2>
set modelines=5

filetype plugin indent on

nmap <script><silent> <Space> :call getchar()<CR>
nmap <C-@> <Space>
nmap <Space>r :so ~/.vimrc<Bar>filetype detect<Bar>doau VimEnter -<CR>

exe 'augroup my'
autocmd!

" Section: Moving around, searching and tags

set ignorecase
set smartcase
set incsearch
set tags=./tags
set include=
set path=.,,

autocmd FileType c,cpp
  \ setl path+=/usr/include inc&
autocmd FileType sh
  \ setl inc=^\\s*\\%(\\.\\\|source\\)\\s |
  \ let &l:path = tr($PATH, ':', ',') . ',.'

" Section: Displaying text

set display=lastline
set scrolloff=1
set lazyredraw

let &g:listchars = "tab:\u21e5\u00b7,trail:\u2423,nbsp:\u00b7"
let &g:fillchars = "fold:\u00b7"

" Section: Windows

set laststatus=2
set statusline=[%n]\ %<%.99f\ %y%m%r%=%-14.(%l,%c%V%)\ %P
set titlestring=%{v:progname}\ %{fnamemodify(getcwd(),':~')}
set title
set mouse=

nnoremap <C-J> <C-w>w
nnoremap <C-K> <C-w>W

" Section: Messages and info

language messages en_US
set confirm
set showcmd
set visualbell

" Section: Editing text and indent

set textwidth=0
set backspace=indent,eol,start
set complete-=i
set formatoptions+=j
set infercase
set showmatch
set virtualedit=block
set nojoinspaces

set shiftround
set smarttab
set autoindent

" Section: Folding and Comments

set foldmethod=marker
set foldopen+=jump

" Section: Maps

inoremap <C-U> <C-G>u<C-U>

" Section: Reading and writing files

set autoread
set autowrite
set encoding=utf-8
set fileformats=unix,dos,mac

set viminfo=!,'20,<50,s10,h
if !empty($SUDO_USER) && $USER !=# $SUDO_USER
  set viminfo=
  set directory-=~/tmp
  set backupdir-=~/tmp
endif

" Section: Command line editing

set wildmenu
set wildignore+=tags

" Section: Filetype settings

autocmd FileType text
  \ setl et list sw=3 tw=72 si imi=1 fo=t1 |
  \ inoremap <buffer> . .<C-G>u|
  \ inoremap <buffer> , ,<C-G>u|
  \ inoremap <buffer> ; ;<C-G>u|
  \ inoremap <buffer> ? ?<C-G>u|
  \ inoremap <buffer> : :<C-G>u|
  \ inoremap <buffer> <C-W> <C-G>u<C-W>|
  \ lnoremap <buffer> ' ’|
  \ lnoremap <buffer> _ —

autocmd FileType tex,plaintex
  \ setl et list sw=2 tw=77 |
  \ let b:tex_stylish= 1

autocmd FileType c,cpp
  \ setl et sts=4 sw=4 tw=80

autocmd FileType sh
  \ setl et sts=2 sw=2 tw=80

autocmd FileType vim
  \ setl kp=:help |
  \ if &foldmethod !=# 'diff' | setl fdm=expr fdl=1 | endif |
  \ setl fde=getline(v:lnum)=~'^\"\ Section:'?'>1':'='

" Section: Highlighting

set spelllang=fr,en
set background=dark
set termguicolors
syntax enable

" Section: Plugin settings

" mkdir -p ~/.vim/pack/others/start
" cd ~/.vim/pack/others/start

" git clone https://tpope.io/vim/repeat.git

" git clone https://tpope.io/vim/fugitive.git
" vim -u NONE -c "helptags fugitive/doc" -c q

" git clone https://tpope.io/vim/commentary.git
" vim -u NONE -c "helptags commentary/doc" -c q

" git clone https://github.com/dpelle/vim-Grammalecte.git
" vim -u NONE -c "helptags vim-Grammalecte/doc" -c q
let g:grammalecte_cli_py =
  \ '$HOME/.local/lib/Grammalecte-fr-v2/grammalecte-cli.py'
let g:grammalecte_disable_rules = 
  \   'espaces_début_ligne espaces_milieu_ligne espaces_fin_de_ligne '
  \ . 'esp_début_ligne esp_milieu_ligne esp_fin_ligne esp_mélangés2 '
  \ . 'typo_guillemet_simple_fermant_non_ouvert typo_signe_moins '
  \ . 'nbsp_après_tiret1'

" mkdir -p ~/.vim/pack/others/opt
" cd ~/.vim/pack/others/opt

" git clone https://github.com/lifepillar/vim-solarized8.git
let g:solarized_italics = 0
silent! colorscheme solarized8
highlight SpecialKey guifg=#657b83 guibg=NONE gui=NONE cterm=NONE

" Section: Misc

" Section: End

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

exe 'augroup END'

" vim: et sw=2 fdm=expr
