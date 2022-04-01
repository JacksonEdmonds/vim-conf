" Disable mouse selection
noremap <LeftDrag> <LeftMouse>
noremap! <LeftDrag> <LeftMouse>

" Set tabs to 2 columns in width
set tabstop=2
set shiftwidth=2

" Indicate indentation level with |
set listchars=tab:\|\
set list

" Set cursor to non-blinking block on start
autocmd VimEnter * silent !echo -ne "\e[2 q"
" Set cursor on mode switch
let &t_SI.="\e[6 q" "SI = INSERT mode, non-blinking bar
let &t_SR.="\e[4 q" "SR = REPLACE mode, non-blinking underline
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE), non-blinking block

" Use {{{ and }}} for folds
set foldmethod=syntax

" Universally set encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8

" Use unix file formats
set fileformats=unix,dos
set fileformat=unix

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

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

" Disable bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" Allow unsaved buffers to run in the background
set hidden

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

" Faster completion
set updatetime=300

" Enable spell checking language (enable with set spell)
set spelllang=en

" Use \s to check file in shellcheck (Only works on Linux)
map <leader>s :!clear && shellcheck %<CR>

" Use the Windows clipboard as the default Vim register
set clipboard=unnamed

"" Plugins (managed with vim-plug, installed with command :PlugInstall)
"call plug#begin('~/.vim/plugged')
"	" Enable file detection and highlighting for a large number of languages
"	Plug 'sheerun/vim-polyglot'
"call plug#end()
"
"" Automatically install missing plugins on startup
"if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"	autocmd VimEnter * PlugInstall
"endif
"
"" Automatically uninstall removed plugins on startup
"if len(filter(split(globpath(g:plug_home, '*'), "\n"), 'isdirectory(v:val)'))
"	\ > len(filter(values(g:plugs), 'stridx(v:val.dir, g:plug_home) == 0'))
"	autocmd VimEnter * PlugClean
"endif
"