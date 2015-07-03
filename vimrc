set nocompatible               " NEVER change this! Use Vim mode, not vi mode.
syntax on                      " Enable colour syntax highlighting
filetype off

" PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'ryanss/vim-hackernews'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'

" CLOJURE
Plugin 'venantius/vim-eastwood'
Plugin 'losingkeys/vim-niji'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

call vundle#end()

filetype plugin indent on      " Enable automatic settings based on file type

" BUFFER (FILE)
set hidden                     " Edit multiple unsaved files at the same time
set confirm                    " Prompt to save unsaved changes when exiting
" Keep various histories between edits
set viminfo='1000,f1,<500,:100,/100

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

" PAREDIT
let g:paredit_electric_return = 0

" SYNTASTIC
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_post_args = '--ignore=E501'
let g:syntastic_javascript_checkers = ['jshint']

" COLORS
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
set t_Co=16

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

