" ~/.vimrc

set nocompatible    " this line must be first or the changes you are expecting
                    " may not be the changes that occur

filetype off

"=============================================================================
" General Settings
"=============================================================================
set noerrorbells    " no error beeps
set novisualbell    " no error flashes

set title           " filename [+=-] (path) - GVIM
set confirm         " starts dialog when exiting without saving

set ignorecase			" search without regards to case
set smartcase       " switch case sensitivity context based on your input
set noincsearch			" don't go immediately to pattern typed
set nohlsearch			" don't highlight search terms
set backspace=indent,eol,start  " backspace over everything
set fileformats=unix,dos,mac    " open files from mac/dos
set autoread                    " refresh buffer content if there are changes

set ruler	          " show line number
set showmode        " display the current mode on the last line
set exrc            " open local config files
set nojoinspaces    " don't add white space when I don't tell you to
set showmatch       " ensure Dyck language
set incsearch       " incremental searching
set nohlsearch      " meh
set bg=dark

set mouse=a         " enable the mouse (enables clicking and scrolling)
set mousehide	      " hides the mouse pointer when typing characters
set undolevels=100  " the commands that can be stored in for undo
set history=20	    " stores the last 20 ':' commands
set nolist	        " tabs are not shown as <TABS> and EOL as <EOL>
set matchtime=2     " tenths of seconds to show matching pairs
set splitbelow      " extra window open below the current window
set bs=2	          " fix backspacing in insert mode

"=============================================================================
" Formating Options
"=============================================================================
set colorcolumn=80      " colors single column at line 80 for visual cue
set autoindent	        " autoindent on
" smartindent is an old script! it was meant to be smart complement to
" autoindent but it keeps fooking up python and ruby comments
"set smartindent         " next line of indention based on previous line
set formatoptions=tcrq	" how to auto indent, see fo-table for description

" Screw it. 2 SPACES ALL!
set expandtab
set shiftwidth=2
set tabstop=2

set wrapmargin=2       " word wraps 2 character spaces from the margin
set shiftround         " rounds < & > command to the nearest mod of shiftwidth
set scrolloff=12       " number of lines to keep around cursor

" do not expand tabs in assembly file -- make them 8 chars wide
au BufRead,BufNewFile *.s setlocal noexpandtab
au BufRead,BufNewFile *.s setlocal shiftwidth=8
au BufRead,BufNewFile *.s setlocal tabstop=8

" Makefile requires tab character unless you provide a separate recipe file
au BufRead,BufNewFile [Mm]akefile setlocal noexpandtab
au BufNewFile [Mm]akefile* setlocal formatoptions=croql comments=:#

au BufNewFile {.vimrc,*.vim} setlocal formatoptions=croql comments=:\"

au FileType c,cpp,java set mps+==:;

au BufRead,BufNewFile *.* setlocal spell " turn on spellcheck
set complete+=kspell                     " spell completion
" marks word under cursor as correct in spellfile - `zg`
" marks word under cursor as incorrect in spellfile - `zw`

"=============================================================================
" Programming Options
"=============================================================================
set showmatch    " show match when inserting {}, [], or ()'s
syntax on
set cin
" need indent keyword so that python/ruby comments format properly
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" code folding!
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

"=============================================================================
" Misc
"=============================================================================
" ignores files when autocompleting
set wildchar=<Tab>     " character that starts the autocompletion
set wildmenu           " shows a list of possible autocompletions
set wildmode=list      " show list and complete the first match
set nowritebackup      " no intermidate files when saving
set wildignore=*.so,*.swp,*.swo,*.zip,*.o,*.bak,*.data,*.class

" map jj to <Esc> to more conveniently escape insert mode
imap jj <Esc>

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=red ctermfg=white guibg=#ed00f5 guifg=white
" toggle the cursor highlight with \c
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" use <ctrl> + h/j/k/l to move between Vim panes
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

