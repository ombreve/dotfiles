if v:version < 800 | finish | endif
set nocp

set ai ar aw bg=dark bs=indent,eol,start cf dy=lastline enc=utf-8
set ffs=unix,dos,mac fo+=j ic inf is ls=2 nojs sc scs sm so=1 sr spl=fr,en sta
set stl=[%n]\ %<%.99f\ %y%m%r%=%-14.(%l,%c%V%)\ %P
set tgc title titlestring=%{fnamemodify(getcwd(),':~')} tw=0
set vb ve=block wig+=tags,*.o wmnu

lan mes en_US
filet plugin indent on
sy enable

let &g:listchars = "tab:\u21e5\u00b7,trail:\u2423,nbsp:\u2423"
let &g:fillchars = "fold:\u00b7"

nn <C-J> <C-w>w
nn <C-K> <C-w>W
ino <C-U> <C-G>u<C-U>

au FileType text setl et list sw=3 tw=72 si imi=1 fo=t1 |
  \ ino <buffer> . .<C-G>u|
  \ ino <buffer> , ,<C-G>u|
  \ ino <buffer> ; ;<C-G>u|
  \ ino <buffer> ? ?<C-G>u|
  \ ino <buffer> ! !<C-G>u|
  \ ino <buffer> : :<C-G>u|
  \ ino <buffer> <C-W> <C-G>u<C-W>|
  \ ln <buffer> ' ’|
  \ ln <buffer> _ —
au FileType tex,plaintex setl et list sw=2 tw=77 | let b:tex_stylish=1
au FileType c,cpp setl et sts=4 sw=4 tw=80
au FileType sh setl et sts=2 sw=2 tw=80
au FileType vim setl kp=:help
au FileType haskell setl tw=80 et sw=2 sts=2

let g:grammalecte_cli_py=
  \ '$HOME/.local/lib/Grammalecte-fr-v2/grammalecte-cli.py'
let g:grammalecte_disable_rules= 
  \   'espaces_début_ligne espaces_milieu_ligne espaces_fin_de_ligne '
  \ . 'esp_début_ligne esp_milieu_ligne esp_fin_ligne esp_mélangés2 '
  \ . 'typo_guillemet_simple_fermant_non_ouvert typo_signe_moins '
  \ . 'nbsp_après_chevrons_ouvrants nbsp_avant_chevrons_fermants1 '
  \ . 'nbsp_avant_deux_points nbsp_avant_double_ponctuation '
  \ . 'nbsp_après_tiret1'

let g:solarized_italics=0
fu! s:tweak_solarized()
  hi clear SpecialKey
  hi MyFIS guifg=#657b83 guibg=NONE gui=NONE cterm=NONE
  match MyFIS / /
endf
au! ColorScheme solarized8 call s:tweak_solarized()
sil! colorscheme solarized8

" mkdir -p ~/.vim/pack/others/start
" cd ~/.vim/pack/others/start
" git clone https://tpope.io/vim/commentary.git
" vim -u NONE -c "helptags commentary/doc" -c q
" git clone https://github.com/tommcdo/vim-exchange
" vim -u NONE -c "helptags vim-exchange/doc" -c q
" git clone https://github.com/dpelle/vim-Grammalecte.git
" vim -u NONE -c "helptags vim-Grammalecte/doc" -c q
" mkdir -p ~/.vim/pack/others/opt
" cd ~/.vim/pack/others/opt
" git clone https://github.com/lifepillar/vim-solarized8.git

" vim: et sw=2
