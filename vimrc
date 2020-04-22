" ~/.vimrc

set nocompatible " this line must be first or the changes you are expecting
                 " may not be the changes that occur

filetype off

"=============================================================================
" General Settings
"=============================================================================

set noerrorbells               " no error beeps
set novisualbell               " no error flashes
set title                      " filename [+=-] (path) - GVIM
set confirm                    " starts dialog when exiting without saving
set ignorecase                 " search without regards to case
set smartcase                  " switch case sensitivity context based on your input
set noincsearch                " don't go immediately to pattern typed
set hlsearch                   " highlight search terms
set backspace=indent,eol,start " backspace over everything
set fileformats=unix,dos,mac   " open files from mac/dos
set autoread                   " refresh buffer content if there are changes
set ruler                      " show line number
set showmode                   " display the current mode on the last line
set exrc                       " open local config files
set nojoinspaces               " don't add white space when I don't tell you to
set showmatch                  " ensure Dyck language
set incsearch                  " incremental searching
set mouse=a                    " enable the mouse (enables clicking and scrolling)
set mousehide                  " hides the mouse pointer when typing characters
set undolevels=100             " the commands that can be stored in for undo
set history=20                 " stores the last 20 ':' commands
set nolist                     " tabs are not shown as <TABS> and EOL as <EOL>
set matchtime=2                " tenths of seconds to show matching pairs
set splitbelow                 " extra window open below the current window
set bs=2                       " fix backspacing in insert mode
set t_Co=256                   " if terminal supports 256 colors

"=============================================================================
" NETRW Settings
"=============================================================================

let g:netrw_liststyle=3 " defaults netrw listing style to tree
let g:netrw_banner=0    " do not display top banner
let g:netrw_altv=1      " open splits to the right

autocmd FileType netrw setl bufhidden=delete " auto delete hidden netrw buffers

"=============================================================================
" Formatting Options
"=============================================================================

" smartindent is an old script! it was meant to be smart complement to
" autoindent but it keeps fooking up python and ruby comments
"set smartindent         " next line of indention based on previous line

set colorcolumn=100    " colors single column at line 100 for visual cue
set autoindent         " autoindent on
set formatoptions=tcrq " how to auto indent, see fo-table for description

" Screw it. 2 SPACES ALL!
set expandtab
set shiftwidth=2
set tabstop=2

set wrapmargin=2 " word wraps 2 character spaces from the margin
set shiftround   " rounds < & > command to the nearest mod of shiftwidth
set scrolloff=12 " number of lines to keep around cursor

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

set showmatch " show match when inserting {}, [], or ()'s
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
set foldopen-=search " do not open code fold even if it has a search hit

" Java options
autocmd Filetype java set makeprg=java\ % " to compile & run leetcode problems in Java

"=============================================================================
" Misc
"=============================================================================

" ignores files when autocompleting
set wildchar=<Tab> " character that starts the autocompletion
set wildmenu       " shows a list of possible autocompletions
set wildmode=list  " show list and complete the first match
set nowritebackup  " no intermediate files when saving
set wildignore=*.so,*.swp,*.swo,*.zip,*.o,*.bak,*.data,*.class

" map jj to <Esc> to more conveniently escape insert mode
imap jj <Esc>

" highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=red ctermfg=white guibg=#ed00f5 guifg=white
" toggle the cursor highlight with \c
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" move lines up and down without going into insert mode or using visual mode
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" similar to tabonly, this closes all open buffers except current open buffer
command! -complete=buffer -bang Bonly
  \ :call Bufonly()
command! -complete=buffer -bang Bufonly
  \ :call Bufonly()
function! Bufonly()
  execute ':w|%bd|e#'
endfunction

" replace grep with ripgrep
" ripgrep feels faster so prefer this over ag too
if executable('rg')
  " use rg over grep
  set grepprg=rg
endif

" binds K to grep for word under cursor
nnoremap <silent> K :Rg <C-R><C-W><CR>

" <silent> means show no message when this key sequence is used
" copy filepath to clipboard
nnoremap <silent> <leader>cp :let @* = expand('%:p')<CR>

"=============================================================================
" Plugins
"=============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc' " dependency for xolox's plugins
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'myusuf3/numbers.vim'
Plug 'henrik/vim-indexed-search'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'thoughtbot/vim-rspec'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

"=============================================================================
" Plugin config
"=============================================================================
" refer to ~/.vim/plugged/vim-colorschemes/color/ for more
colorscheme space-vim-dark

" put cursor on a line between { and }
let delimitMate_expand_cr=1

" better-whitespace config
" highlight bad whitespace
hi ExtraWhitespace ctermbg=white
" strip whitespace on save without confirming
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

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
let g:airline#extensions#branch#enabled=1

" nerdcommenter config
let g:NERDSpaceDelims=1       " add number of spaces after comment delimiter
let g:NERDDefaultAlign='left' " align line-wise delimiters flush left
let g:NERDCommentEmptyLines=1 " comment/invert empty lines (useful for large block comment/region)

" vim-easy-align config
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf config
nnoremap <C-f> :FZF<cr>
" you can actually set ENV vars in a vimrc file
" this change changes the search command FZF uses to silver_searcher
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

" vim-rspec config
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
