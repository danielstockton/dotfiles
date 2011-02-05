set nocompatible               " NEVER change this! Use Vim mode, not vi mode.
filetype plugin indent on      " Enable automatic settings based on file type
syntax on                      " Enable colour syntax highlighting

" Buffer (File) Options:
set hidden                     " Edit multiple unsaved files at the same time
set confirm                    " Prompt to save unsaved changes when exiting
" Keep various histories between edits
set viminfo='1000,f1,<500,:100,/100

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
set number                     " Display line numbers at left of screen
set visualbell                 " Flash the screen instead of beeping on errors
set t_vb=                      " And then disable even the flashing
set mouse=a                    " Enable mouse usage (all modes) in terminals
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation Options:
set tabstop=8                  " NEVER change this!
" Change the '2' value below to your preferred indentation level
set shiftwidth=2
set softtabstop=2              " Number of spaces for each indent level
set expandtab                  " Even when pressing <Tab>

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme railscasts
else
  colorscheme default
endif
