set nocompatible               " NEVER change this! Use Vim mode, not vi mode.
syntax on                      " Enable colour syntax highlighting

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "git://github.com/gmarik/vundle.git"
Bundle "git://github.com/vim-scripts/VimClojure.git"
Bundle "git://github.com/tpope/vim-rails.git"
Bundle "git://github.com/wincent/Command-T.git"
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle "git://github.com/mineiro/vim-latex.git"
Bundle "git://github.com/tpope/vim-surround.git"
Bundle "git://github.com/wlangstroth/vim-racket.git"
Bundle "git://github.com/sukima/xmledit.git"
Bundle "git://github.com/kchmck/vim-coffee-script.git" 
Bundle "git://github.com/jpalardy/vim-slime.git"
Bundle "git://github.com/groenewege/vim-less.git"
Bundle "git://github.com/ervandew/supertab.git"

filetype plugin indent on      " Enable automatic settings based on file type

" Buffer (File) Options:
set hidden                     " Edit multiple unsaved files at the same time
set confirm                    " Prompt to save unsaved changes when exiting
" Keep various histories between edits
set viminfo='1000,f1,<500,:100,/100

" TAB COMPLETION
let g:SuperTabDefaultCompletionType = "context""
let g:SuperTabClosePreviewOnPopupClose = 1 

" Search Options:
set hlsearch                   " Highlight searches. See below for more.
set ignorecase                 " Do case insensitive matching...
set smartcase                  " ...except when using capital letters
set incsearch                  " Incremental search

" Insert (Edit) Options:
set backspace=indent,eol,start " Better handling of backspace key
set autoindent                 " Sane indenting when filetype not recognised
set nostartofline              " Emulate typical editor navigation behaviour
set nopaste                    " Start in normal (non-paste) mode
set pastetoggle=<f11>          " Use <F11> to toggle between 'paste' and 'nopaste'

" Status / Command Line Options:
set wildmenu                   " Better commandline completion
set wildmode=longest:full,full " Expand match on first Tab complete
set showcmd                    " Show (partial) command in status line.
set laststatus=2               " Always show a status line
set cmdheight=2                " Prevent "Press Enter" message after most commands
" Show detailed information in status line
set statusline=%f%m%r%h%w\ [%n:%{&ff}/%Y]%=[0x\%04.4B][%03v][%p%%\ line\ %l\ of\ %L]

" Interface Options:
" Relative line numbers except in insert mode
set rnu
autocmd InsertEnter * :set number
autocmd InsertLeave * :set rnu

set visualbell                 " Flash the screen instead of beeping on errors
set t_vb=                      " And then disable even the flashing
set mouse=a                    " Enable mouse usage (all modes) in terminals
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" INDENTATION 
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab

" Save and load folds automatically
" au BufWinLeave * mkview
au BufWinEnter *.* silent loadview

" COLORS
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun=0
let vimclojure#NailgunClient="/home/daniel/.vim/bundle/VimClojure/lib/client/ng"
