set nocompatible    " This line must be first or the changes you are expecting
                    " may not be the changes that occur

"=============================================================================
" General Settings
"=============================================================================
set noerrorbells        " no error beeps
set novisualbell        " no error flashes

set title               " filename [+=-] (path) - GVIM
set confirm             " Starts dialog when exiting without saving

set ignorecase			" search without regards to case
set noincsearch			" don't go immediately to pattern typed
set nohlsearch			" don't highlight search terms
set backspace=indent,eol,start  " backspace over everything
set fileformats=unix,dos,mac    " open files from mac/dos

set ruler	        " show line number
set showmode            " Display the current mode on the last line
set exrc                " open local config files
set nojoinspaces        " don't add white space when I don't tell you to
set showmatch           " ensure Dyck language
set incsearch           " incremental searching
set nohlsearch          " meh
:colorscheme grb256

:set mouse=a		" allows mouse clicking, using this mostly for NERDTree
:set mousehide	        " Hides the mouse pointer when typing characters
:set undolevels=100     " The commands that can be stored in for undo
:set history=20	        " Stores the last 20 ':' commands
:set nolist	        " Tabs are not shown as <TABS> and EOL as <EOL>
:set matchtime=2        " Tenths of seconds to show matching pairs
:set splitbelow         " Extra window open below the current window

"=============================================================================
" Formating Options
"=============================================================================
set bs=2	        " fix backspacing in insert mode

set autoindent	        " autoindent on
set smartindent         " next line of indention based on previous line
set formatoptions=tcrq	" how to auto indent, see fo-table for description

set columns=80			" set the number of columns in a new window
"set textwidth=80		" max width of text being inserted
set wrapmargin=2		" word wraps 2 characters from the margin
"syntax on			" shows different colors highlighting keywords

:set columns=80         " Set the number of columns a new window will have
":set textwidth=80       " I do not like going all the way to the edge 
:set wrapmargin=2       " Word wraps 2 character spaces from the margin
:set shiftround         " Rounds < & > command to the nearest mod of shiftwidth
:set scrolloff=12       " Number of lines to keep around cursor

"=============================================================================
" Programming Options
"=============================================================================
set showmatch          " Show match when inserting {}, [], or ()'s
set cin

"=============================================================================
" Misc
"=============================================================================
" Ignores files when autocompleting      
:set wildchar=<Tab>     " Character that starts the autocompletion
:set wildmenu           " Shows a list of possible autocompletions
:set wildmode=list      " show list and complete the first match 
:set nowritebackup      " No intermidate files when saving

:set wildignore=*.o,*.bak,*.data,*.class

" For switching between many opened file by using ctrl+l or ctrl+h
map <C-J> :next <CR>
map <C-K> :prev <CR>

" To open NERDTree quicker
map <C-n> :NERDTree <CR>

" To open CtrlP quicker
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Spelling toggle via F10 and F11
map <F10> <Esc>setlocal spell spelllang=en_us<CR>
map <F11> <Esc>setlocal nospell<CR>

"setlocal textwidth=80           " used for text wrapping

" For vim.pathogen which is the easiest way to use vim plugins
execute pathogen#infect()

" Autostart NERDTree when vim starts up if no files specified
autocmd vimenter * if !argc() | NERDTree | endif

" Autostart NERDTRee when vim starts up
autocmd vimenter * NERDTree

" Fix NERDTree Unicode error on dir arrows
let g:NERDTreeDirArrows=0
