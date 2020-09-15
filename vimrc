" Disable mouse selection
noremap <LeftDrag> <LeftMouse>
noremap! <LeftDrag> <LeftMouse>

" Set tabs to 4 columns in width
set tabstop=4
set shiftwidth=4

" Indicate indentation level with |
set listchars=tab:\|\ 
set list

" Use {{{ and }}} for folds
set foldmethod=marker

" Universally set encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8

" Use unix file formats
set fileformats=unix,dos
set fileformat=unix

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Don't wrap lines
set nowrap

" Display line numbers
set number

" Always show current position
set ruler

" Highlight search results
set hlsearch

" Clear search results with space
:nnoremap <silent> <space> :nohlsearch<CR>

" Search wraps around the file
set wrapscan

" Only apply case when specifying uppercase in search
set ignorecase
set smartcase

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=1

" Tabs at the start of a line are removed with a single backspace
set smarttab

" Enable filetype detection (for syntax highlighting, options, etc)
filetype on
filetype plugin on
filetype indent on

" 1 tab indents 2 columns
set ai "Auto indent, copy indent from previous line when starting a new line
set cindent "C style smart indenting (automatically indents based on code structure when starting a new line)
set cinkeys-=0# "Allow indenting of #

" Set visual bell
set vb

" Allow unsaved buffers to run in the background
set hidden

"set viminfo=%,'100,<50,s10,h,rA:,rB:
set viminfo=%,'200,/50,:50,h
"           | |    |   |   |
"           | |    |   |   |
"           | |    |   |   + Don't highlight previously searched text when loading a file
"           | |    |   + Save the last command-line entries in history
"           | |    + Save the last 50 searches in history
"           | + Save mark info for the last 200 edited files
"           + Remember info about open buffers on close

" Always show the status line
set laststatus=2

" Set the status line the way I like it
set stl=%f\ %m\ %R\ %y\ %=%l\/%L\:\%c\ [%p%%]\ 0x\%-3B

" Hide the cursor while typing
set mousehide

" Don't update the display while executing macros
set lazyredraw

" Show the current mode
set showmode

" Enable syntax highlighting
syntax enable

" When the page starts to scroll, keep the cursor 5 lines from the top and bottom
set scrolloff=5

" Allow the cursor to go into invalid places
set virtualedit=all

" Allow for tab autocomplete of settings (complete to the next full match, after which show list of all potential matches)
set wildmode=longest,list
set wildmenu

" Disable automatic commenting on newline (distable auto-wrap comment, new line from enter, new line from o or O)
autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o

" Move around splits with ctrl+direction (instead of ctrl+w direction)
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Enable spell checking language (enable with set spell)
set spelllang=en

" Use \s to check file in shellcheck (Only works on Linux)
map <leader>s :!clear && shellcheck %<CR>

" Plugins (managed with vim-plug, installed with command :PlugInstall)
call plug#begin('../plugged')
" Enable tab completion
Plug 'ajh17/VimCompletesMe'
" Enable PowerShell file detection and highlighting 
Plug 'PProvost/vim-ps1'
call plug#end()

" Use the Windows clipboard as the default Vim register
set clipboard=unnamed
