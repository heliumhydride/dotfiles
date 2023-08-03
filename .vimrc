" set backspace to 2 (only useful for windows)
" set bs=2
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

" Brace+quotes autocomplete
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
