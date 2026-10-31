" set colorscheme
color catppuccin_mocha
if !has('gui_running')
    set termguicolors
endif

" uncomment if needed:
" fix syntax highlighting rendering issue on windows terminal (win32 only, fine on wsl)
" autocmd WinScrolled * redraw!

" for lightline
set laststatus=2
set noshowmode
set background=dark
let g:lightline = {'colorscheme': 'catppuccin_mocha'}

" fix ligatures (depends on running os)
if has('gui_running')
    if has('win32')
        set renderoptions=type:directx
        set encoding=utf-8
    else
        set guiligatures=!\"$%&\'()*+,-./:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{\|}~
    endif
endif

" fix backspace on non-linux (from experience windows and *bsd)
if !has('linux')
    set bs=2
endif

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

" When pressing tab, write 4 spaces instead, except when using makefiles because only tabs are supported with makefiles
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

" nicer searching
set hlsearch
nnoremap <F4> :noh<CR>

" setup omnicomplete for autocompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" ... and configure it
set completeopt=menuone,noinsert,noselect

" Now time for some templates!
if has('win32')
    let $TEMPLATES_DIR = "~/vimfiles/templates"
else
    let $TEMPLATES_DIR = "~/.vim/templates"
endif

function Tc()
    :r $TEMPLATES_DIR/Tc.c
endfunction

function Tmakefile()
    :r $TEMPLATES_DIR/Tmakefile.mk
endfunction

function Tmakefile2()
    :r $TEMPLATES_DIR/Tmakefile2.mk
endfunction

function Thtml()
    :r $TEMPLATES_DIR/Thtml.html
endfunction

function Tcss()
    :r $TEMPLATES_DIR/Tcss.css
endfunction
