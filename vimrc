22" ~/.vimrc

set nocompatible    " This line must be first or the changes you are expecting
                    " may not be the changes that occur

filetype off
execute pathogen#infect()

"============================================================================
" Vundle Settings
"============================================================================
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'

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
"set nu 		" line numbers on
set showmode            " Display the current mode on the last line
set exrc                " open local config files
set nojoinspaces        " don't add white space when I don't tell you to
set showmatch           " ensure Dyck language
set incsearch           " incremental searching
set nohlsearch          " meh
set bg=dark

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

" Expand tabs in C files to spaces
au BufRead,BufNewFile *.{c,h,java,hpp,cpp} set expandtab
au BufRead,BufNewFile *.{c,h,java,hpp,cpp} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java,hpp,cpp} set tabstop=2

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

"set columns=80			" set the number of columns in a new window
"set textwidth=80		" max width of text being inserted
set wrapmargin=2		" word wraps 2 characters from the margin

":set columns=80         " Set the number of columns a new window will have
":set textwidth=80       " I do not like going all the way to the edge 
:set wrapmargin=2       " Word wraps 2 character spaces from the margin
:set shiftround         " Rounds < & > command to the nearest mod of shiftwidth
:set scrolloff=12       " Number of lines to keep around cursor
":match ErrorMsg '\%>80v.\+' " Set characters pass 80 to different color 

"=============================================================================
" Programming Options
"=============================================================================
set showmatch          " Show match when inserting {}, [], or ()'s
syntax on 
set cin
filetype plugin on
set omnifunc=syntaxcomplete#Complete
:set makeprg=gcc\ %\ &&\ ./a.out " Compile C file and run a.out with one cmd
                                 " :make

"=============================================================================
" Misc
"=============================================================================
" Ignores files when autocompleting      
:set wildchar=<Tab>     " Character that starts the autocompletion
:set wildmenu           " Shows a list of possible autocompletions
:set wildmode=list      " show list and complete the first match 
:set nowritebackup      " No intermidate files when saving

:set wildignore=*.o,*.bak,*.data,*.class

autocmd BufNewFile [Mm]akefile* set formatoptions=croql comments=:#
autocmd BufNewFile .vimrc,*.vim set formatoptions=croql comments=:\"
autocmd FileType c,cpp,java set mps+==:;

" Spelling toggle via F10 and F11
map <F10> <Esc>setlocal spell spelllang=en_us<CR>
map <F11> <Esc>setlocal nospell<CR>

" Switch between vim tabs quickly
map <C-J> :tabprevious <CR>
map <C-K> :tabnext <CR>

"setlocal textwidth=80           " used for text wrapping
"match ErrorMsg '\%>80v.+'

"=============================================================================
" For vim plugins
"=============================================================================

" Shortcut to toggle NERDTree
map <C-n> :NERDTreeToggle <CR>

" Autostart NERDTree when vim starts up
autocmd vimenter * NERDTree

" Autostart NERDTree when vim starts up if no files specified
autocmd vimenter * if !argc() | NERDTree | endif

" Shortcut for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Put cursor on a line between { and }
let delimitMate_expand_cr = 1
