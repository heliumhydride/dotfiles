" line numbers
set number
" dont create a ton of files
set noswapfile
set nobackup
set nowritebackup
" autodetect filetype
filetype detect
" autoindent
set smartindent
" syntax highlighting
syntax on
" auto cd to files dir
set autochdir
" show exissting tab to be 2 spaces width
set tabstop=2
" When pressing tab, print 2 spaces instead
set expandtab

" Brace+quotes autocomplete
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" Now time for some templates!
function Tc()
    :r ~/.vim/templates/Tc.c
endfunction

function Tmakefile()
    :r ~/.vim/templates/Tmakefile.mk
endfunction

function Tmakefile2()
    :r ~/.vim/templates/Tmakefile2.mk
endfunction

function Tsdlc()
    :r ~/.vim/templates/Tsdlc.c
endfunction

function Tpygame()
    :r ~/.vim/templates/Tpygame.py
endfunction
