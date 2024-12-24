set termguicolors
" for lightline
set laststatus=2
set noshowmode
set background=dark
let g:lightline = {'colorscheme': 'catppuccin_mocha'}
" fix ligatures on non-windows
set guiligatures=!\"$%&\'()*+,-./:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{\|}~
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
" show existing tab to be 2 spaces width
set tabstop=2
" When pressing tab, print 2 spaces instead, except when using makefiles
" because only tabs are supported with makefiles
if(&ft != 'makefile')
  set expandtab
endif
" Only autoindent by 2 spaces
set shiftwidth=2

" Brace+quotes autocomplete
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" setup omnicomplete for autocompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

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

