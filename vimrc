22" ~/.vimrc

set nocompatible    " This line must be first or the changes you are expecting
                    " may not be the changes that occur

filetype off

" Auto install vim-plug and plugins listed in your vimrc if haven't already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentline'
Plug 'Raimondi/delimitMate'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'bling/vim-airline'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'rking/ag.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'othree/html5.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'jpalardy/vim-slime'
call plug#end()

"=============================================================================
" General Settings
"=============================================================================
set noerrorbells        " no error beeps
set novisualbell        " no error flashes

set title               " filename [+=-] (path) - GVIM
set confirm             " Starts dialog when exiting without saving

set ignorecase			" search without regards to case
set smartcase       " switch case sensitivity context depending on what cases you type
set noincsearch			" don't go immediately to pattern typed
set nohlsearch			" don't highlight search terms
set backspace=indent,eol,start  " backspace over everything
set fileformats=unix,dos,mac    " open files from mac/dos
set autoread                    " refresh buffer (file) content if there are changes

set ruler	        " show line number
"set nu 		     " line numbers on
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
:set nolist	            " Tabs are not shown as <TABS> and EOL as <EOL>
:set matchtime=2        " Tenths of seconds to show matching pairs
:set splitbelow         " Extra window open below the current window

"=============================================================================
" Formating Options
"=============================================================================
set colorcolumn=80
set bs=2	              " fix backspacing in insert mode
set autoindent	        " autoindent on
" smartindent is an old script! it was meant to be smart complement to
" autoindent but it keeps fooking up python and ruby comments
"set smartindent         " next line of indention based on previous line
set formatoptions=tcrq	" how to auto indent, see fo-table for description

" Expand tabs in these files to spaces
" au BufRead,BufNewFile *.{c,h,java,hpp,cpp,rb,py,erb,js,coffee,html,ts,rake,css,scss} set expandtab
" au BufRead,BufNewFile *.{c,h,java,hpp,cpp,rb,py,erb,js,coffee,html,ts,rake,css,scss} set shiftwidth=2
" au BufRead,BufNewFile *.{c,h,java,hpp,cpp,rb,py,erb,js,coffee,html,ts,rake,css,scss} set tabstop=2

" Screw it. 2 SPACES ALL!
set expandtab
set shiftwidth=2
set tabstop=2

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

:set wildignore=*.so,*.swp,*.swo,*.zip,*.o,*.bak,*.data,*.class

autocmd BufNewFile [Mm]akefile* set formatoptions=croql comments=:#
autocmd BufNewFile .vimrc,*.vim set formatoptions=croql comments=:\"
autocmd FileType c,cpp,java set mps+==:;
autocmd BufRead,BufNewFile *.* setlocal spell " Turn on spellcheck
set complete+=kspell                          " Spell completion
" Marks word under cursor as correct in spellfile - `zg`
" Marks word under cursor as incorrect in spellfile - `zw`

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

" Don't run CtrlP for .gitignore'd files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NERDTree and CtrlP working together!
" Using the two options below NERDTree will dynamically change root with CWD
" CtrlP will read root from outside of CWD
" This means that CtrlP search will now be project focused and instead of
" reading up until it finds root marker which is commonly .git/ for my work
" but also includes .hg, .svn, .bzr and _darcs as markers
let g:NERDTreeChDirMode = 2 " CWD changes whenever the root is changed
let g:ctrlp_working_path_mode = 'rw' " Find root from CWD outside of CtrlP
" The following root markers are a custom setting for work because I am
" working in a unirepo where there exists only one .git/ for 30+ projects
let g:ctrlp_root_markers = ['.gitignore', 'README.md', 'Makefile']



" Put cursor on a line between { and }
let delimitMate_expand_cr = 1

" Map jj to <Esc> to more conveniently escape insert mode
:imap jj <Esc>

" Use jellybeans theme
:color jellybeans

" Highlight current line
:set cursorline
:hi CursorLine cterm=NONE ctermbg=red ctermfg=white guibg=#ed00f5 guifg=white
" Toggle the cursor highlight with \c
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Enable NerdTreeTabs on vim startup
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=1

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
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_ignore_errors = ["proprietary attribute \"ng-"] " Gets rid of a few AngularJS specific lints

" Run gem install rubocop
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

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
highlight ExtraWhitespace ctermbg=blue

" vim-javascript config
let g:javascript_enable_domhtmlcss=1

" vim-jsx config
let g:jsx_ext_required=1 " Enables jsx syntax highlighting only for .jsx files

" vim-es6 & vim-javascript? this sets js highlighting for .es6
au BufReadPost *.es6 set syntax=javascript

" default tmux as the slime target (SLIME is a REPL)
let g:slime_target="tmux"
