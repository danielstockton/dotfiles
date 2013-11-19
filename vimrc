set nocompatible               " NEVER change this! Use Vim mode, not vi mode.
syntax on                      " Enable colour syntax highlighting
filetype off

" PLUGINS
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

Bundle "altercation/vim-colors-solarized"
Bundle "editorconfig/editorconfig-vim"
Bundle "ervandew/supertab"
Bundle "groenewege/vim-less"
Bundle "kchmck/vim-coffee-script"
Bundle "kien/ctrlp.vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "majutsushi/tagbar"
Bundle "pangloss/vim-javascript"
Bundle "scrooloose/nerdcommenter"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-surround"

" CLOJURE
Bundle "amdt/vim-niji"
Bundle "guns/vim-clojure-static"
Bundle "tpope/vim-classpath"
Bundle "tpope/vim-fireplace"
Bundle "vim-scripts/paredit.vim"


filetype plugin indent on      " Enable automatic settings based on file type

" BUFFER (FILE)
set hidden                     " Edit multiple unsaved files at the same time
set confirm                    " Prompt to save unsaved changes when exiting
" Keep various histories between edits
set viminfo='1000,f1,<500,:100,/100

" TAB COMPLETION
let g:SuperTabDefaultCompletionType = "context""
let g:SuperTabClosePreviewOnPopupClose = 1

" SEARCH
set hlsearch                   " Highlight searches. See below for more.
set ignorecase                 " Do case insensitive matching...
set smartcase                  " ...except when using capital letters
set incsearch                  " Incremental search

" INSERT (EDIT)
set backspace=indent,eol,start " Better handling of backspace key
set autoindent                 " Sane indenting when filetype not recognised
set nostartofline              " Emulate typical editor navigation behaviour
set nopaste                    " Start in normal (non-paste) mode
set pastetoggle=<f11>          " Use <F11> to toggle between 'paste' and 'nopaste'

" COMMAND LINE
set wildmenu                   " Better commandline completion
set wildmode=longest:full,full " Expand match on first Tab complete
set showcmd                    " Show (partial) command in status line.
set laststatus=2               " Always show a status line
set cmdheight=2                " Prevent "Press Enter" message after most commands
" Show detailed information in status line
set statusline=%f%m%r%h%w\ [%n:%{&ff}/%Y]%=[0x\%04.4B][%03v][%p%%\ line\ %l\ of\ %L]

" INTERFACE
set rnu
autocmd InsertEnter * :set number
autocmd InsertLeave * :set rnu

set visualbell                 " Flash the screen instead of beeping on errors
set t_vb=                      " And then disable even the flashing
set mouse=a                    " Enable mouse usage (all modes) in terminals
set notimeout ttimeout ttimeoutlen=200

" INDENTATION
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab

" WHITESPACE
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
autocmd BufWritePre * :%s/\s\+$//e

" TAGS
nmap <leader>a :TagbarToggle<CR>

" COLORS
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
set t_Co=16

" EXPERIMENTAL
" Disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
