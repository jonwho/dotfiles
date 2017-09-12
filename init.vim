" ~/.config/nvim/init.vim

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
set hlsearch			  " highlight search terms
set backspace=indent,eol,start  " backspace over everything
set fileformats=unix,dos,mac    " open files from mac/dos
set autoread                    " refresh buffer content if there are changes

set ruler	          " show line number
set showmode        " display the current mode on the last line
set exrc            " open local config files
set nojoinspaces    " don't add white space when I don't tell you to
set showmatch       " ensure Dyck language
set incsearch       " incremental searching

set mouse=a         " enable the mouse (enables clicking and scrolling)
set mousehide	      " hides the mouse pointer when typing characters
set undolevels=100  " the commands that can be stored in for undo
set history=20	    " stores the last 20 ':' commands
set nolist	        " tabs are not shown as <TABS> and EOL as <EOL>
set matchtime=2     " tenths of seconds to show matching pairs
set splitbelow      " extra window open below the current window
set bs=2	          " fix backspacing in insert mode
set t_Co=256        " if terminal supports 256 colors

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

" python pep8 prefers 4 spaces for indentation
au BufRead,BufNewFile *.py setlocal expandtab
au BufRead,BufNewFile *.py setlocal shiftwidth=4
au BufRead,BufNewFile *.py setlocal tabstop=4

" Makefile requires tab character unless you provide a separate recipe file
au BufRead,BufNewFile [Mm]akefile setlocal noexpandtab
au BufNewFile [Mm]akefile* setlocal formatoptions=croql comments=:#

au BufNewFile {.vimrc,*.vim} setlocal formatoptions=croql comments=:\"

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
set nowritebackup      " no intermediate files when saving
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

"=============================================================================
" Plugins
"=============================================================================
" auto install vim-plug and plugins listed in your init.vim if haven't already
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Lokaltog/vim-easymotion'
Plug 'Yggdroot/indentline'
Plug 'Raimondi/delimitMate'
" make sure vim-endwise is included after delimitMate
" otherwise it will break when trying to add CR between pairs
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'leafgarland/typescript-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'jpalardy/vim-slime'
Plug 'henrik/vim-indexed-search'
Plug 'myusuf3/numbers.vim'
Plug 'flazz/vim-colorschemes'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'elubow/cql-vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

"=============================================================================
" Plugin config
"=============================================================================
" refer to ~/.local/share/nvim/plugged/vim-colorschemes/colors/
" or :colorscheme <tab> to see list
colorscheme molokai

" dont know which plugin it is but it was concealing double quotes from json
" files which made it very difficult to see what was going on
" this turns the concealer off
set conceallevel=0

" deoplete config
let g:deoplete#enable_at_startup=1
" deoplete tab completion similar to YCM
" otherwise would have to use <C-n> or <C-p> to cycle through completion list
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

" NERDTree config
" shortcut to toggle NERDTree
map <C-n> :NERDTreeToggle <CR>
" show hidden files in NERDTree on startup <shift>+<i> to toggle
let NERDTreeShowHidden=1

" autostart NERDTree when vim starts up if no files specified
au vimenter * if !argc() | NERDTree | endif

let g:NERDTreeChDirMode=2 " CWD changes whenever the root is changed

" put cursor on a line between { and }
let delimitMate_expand_cr=1

" enable NerdTreeTabs on vim startup
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=1

" highlight bad whitespace
hi ExtraWhitespace ctermbg=blue

" vim-javascript config
let g:javascript_enable_domhtmlcss=1

" vim-jsx config
let g:jsx_ext_required=0 " Enables jsx syntax highlighting for .js files too

" vim-es6 & vim-javascript? this sets js highlighting for .es6
au BufReadPost *.es6 set syntax=javascript

" vim-slime config
" default tmux as the slime target (SLIME is a REPL)
let g:slime_target="tmux"

" vim-easytags config
" set easytags to update tags asynchronously else it will block vim
let g:easytags_async=1
" disable auto highlight because it kept blocking vim
let g:easytags_auto_highlight=0

" vim-airline config
let g:airline_theme='deus'
" enable advanced tabline display
let g:airline#extensions#tabline#enabled=1
" enable tabline indices so index shows next to associated tab
" e.g. 1gt or 12gt to jump to first or twelfth tab
let g:airline#extensions#tabline#tab_nr_type=1
" turn off buffer listing on the top right
" saves precious room on the tabline
let g:airline#extensions#tabline#show_splits=0
" dont show buffers in tabline
" was annoying to see tabline filled with hidden buffers
" :bd to kill current buffer but :q closes the tab, note the difference
let g:airline#extensions#tabline#show_buffers=0
" unfortunately need to turn off branch support cuz current bug with vim/nvim?
" and use of system() call
let g:airline#extensions#branch#enabled=0

" javacomplete2 config
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" vim-easy-align config
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf config
nnoremap <C-f> :FZF<cr>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
