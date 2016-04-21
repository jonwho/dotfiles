22" ~/.vimrc

set nocompatible    " This line must be first or the changes you are expecting
                    " may not be the changes that occur

filetype off
execute pathogen#infect()

"============================================================================
" Vundle Settings
"============================================================================
"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Valloric/YouCompleteMe'
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
set smartcase                   " switch case sensitivity context depending on what cases you type
set noincsearch			" don't go immediately to pattern typed
set nohlsearch			" don't highlight search terms
set backspace=indent,eol,start  " backspace over everything
set fileformats=unix,dos,mac    " open files from mac/dos
set autoread                    " refresh buffer (file) content if there are changes  

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
" smartindent is an old script! it was meant to be smart complement to
" autoindent but it keeps fooking up python and ruby comments
" set smartindent         " next line of indention based on previous line
set formatoptions=tcrq	" how to auto indent, see fo-table for description

" Expand tabs in these files to spaces
au BufRead,BufNewFile *.{c,h,java,hpp,cpp,rb,py,erb,js,coffee,html,ts,rake,css,scss} set expandtab
au BufRead,BufNewFile *.{c,h,java,hpp,cpp,rb,py,erb,js,coffee,html,ts,rake,css,scss} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java,hpp,cpp,rb,py,erb,js,coffee,html,ts,rake,css,scss} set tabstop=2

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
filetype plugin indent on " Need indent keyword so that python/ruby comments format properly
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

"setlocal textwidth=80           " used for text wrapping
"match ErrorMsg '\%>80v.+'

"=============================================================================
" For vim plugins
"=============================================================================

" Shortcut to toggle NERDTree
map <C-n> :NERDTreeToggle <CR>
" Show hidden files in NERDTree on startup <shift>+<i> to toggle
let NERDTreeShowHidden=1

" Autostart NERDTree when vim starts up
" autocmd vimenter * NERDTree

" Autostart NERDTree when vim starts up if no files specified
autocmd vimenter * if !argc() | NERDTree | endif

" Shortcut for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Put cursor on a line between { and }
let delimitMate_expand_cr = 1

" Map jj to <Esc> to more conveniently escape insert mode
:imap jj <Esc>

" Use jellybeans theme
:color jellybeans

" Highlight current line
:set cursorline
:hi CursorLine cterm=NONE ctermbg=red ctermfg=white guibg=#ed00f5 guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR> " Toggle the cursor highlight with \c

" Enable NerdTreeTabs on vim startup
let g:nerdtree_tabs_open_on_console_startup=1

" Use <ctrl> + h/j/k/l to move between Vim panes
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" Enable the mouse (notable: click cursor location and scrolling)
:set mouse=a

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Run 'npm install -g jshint' to put jshint in PATH
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors = ["proprietary attribute \"ng-"]

" Configure Ag to always search from project root instead of cwd unless dir specified
let g:ag_working_path_mode="r"

" Call typescript autocompletion with YCM
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" Code folding!
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Highlight bad whitespace
highligh ExtraWhitespace ctermbg=blue
