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
" show existing tab to be 4 spaces width
set tabstop=4
" When pressing tab, write 4 spaces instead, except when using makefiles
" because only tabs are supported with makefiles
if(&ft != 'makefile')
  set expandtab
endif
" Only autoindent by 4 spaces
set shiftwidth=4

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
" ... and configure it
set completeopt=menuone,noinsert,noselect

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

function Thtml()
    :r ~/.vim/templates/Thtml.html
endfunction

function Tcss()
    :r ~/.vim/templates/Tcss.css
endfunction
