" Section: Bootstrap

if v:version < 800 | finish | endif

set nocompatible
set pastetoggle=<F2>
set modelines=5

filetype plugin indent on
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

let &g:listchars = "tab:\u21e5\u00b7,trail:\u2423,nbsp:\u2423"
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
call digraph_set('  ', ' ')

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
  \ lnoremap <buffer> _ —|
  \ lnoremap <buffer> =  |

autocmd FileType tex,plaintex
  \ setl et list sw=2 tw=77 |
  \ let b:tex_stylish=1

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

" git clone https://github.com/tpope/vim-fugitive.git
" vim -u NONE -c "helptags vim-fugitive/doc" -c q

" git clone https://tpope.io/vim/commentary.git
" vim -u NONE -c "helptags commentary/doc" -c q

" https://github.com/tpope/vim-surround.git
" vim -u NONE -c "helptags vim-surround/doc" -c q

" git clone https://github.com/tommcdo/vim-exchange
" vim -u NONE -c "helptags vim-exchange/doc" -c q

" git clone https://github.com/dpelle/vim-Grammalecte.git
" vim -u NONE -c "helptags vim-Grammalecte/doc" -c q
let g:grammalecte_cli_py=
  \ '$HOME/.local/lib/Grammalecte-fr-v2/grammalecte-cli.py'
let g:grammalecte_disable_rules= 
  \   'espaces_début_ligne espaces_milieu_ligne espaces_fin_de_ligne '
  \ . 'esp_début_ligne esp_milieu_ligne esp_fin_ligne esp_mélangés2 '
  \ . 'typo_guillemet_simple_fermant_non_ouvert typo_signe_moins '
  \ . 'nbsp_après_tiret1'

" git clone https://github.com/junegunn/limelight.vim.git

" git clone https://github.com/junegunn/goyo.vim.git
" vim -u NONE -c "helptags goyo.vim/doc" -c q
function! s:goyo_enter()
  setlocal scrolloff=999
  Limelight
endfunction
function! s:goyo_leave()
  setlocal scrolloff=1
  Limelight!
endfunction
autocmd! User GoyoEnter nested call s:goyo_enter()
autocmd! User GoyoLeave nested call s:goyo_leave()

" mkdir -p ~/.vim/pack/others/opt
" cd ~/.vim/pack/others/opt

" git clone https://github.com/lifepillar/vim-solarized8.git
let g:solarized_italics=0
function! s:tweak_solarized()
  highlight clear SpecialKey
  highlight MyFIS guifg=#657b83 guibg=NONE gui=NONE cterm=NONE
  match MyFIS / /
endfunction
autocmd! ColorScheme solarized8 call s:tweak_solarized()
silent! colorscheme solarized8

" Section: End

exe 'augroup END'

" vim: et sw=2 fdm=expr
