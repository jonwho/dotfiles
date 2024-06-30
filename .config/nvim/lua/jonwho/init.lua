require("jonwho.remap")

-- this line must be first or the changes you are expecting
-- may not be the changes that occur
vim.o.compatible = false

vim.o.filetype = 'on'

local autocmd = vim.api.nvim_create_autocmd

-------------------------------------------------------------------------------
-- General Settings
-------------------------------------------------------------------------------

-- run `gaip <C-g> <C-x> --*` to align comments
vim.o.errorbells      = false          -- no error beeps
vim.o.visualbell      = false          -- no error flashes
vim.o.title           = true           -- filename [+=-] (path) - GVIM
vim.o.confirm         = true           -- starts dialog when exiting without saving
vim.o.ignorecase      = true           -- search without regards to case
vim.o.smartcase       = true           -- switch case sensitivity context based on your input
vim.o.hlsearch        = true           -- highlight search terms
vim.o.fileformats     = "unix,dos,mac" -- open files from mac/dos
vim.o.autoread        = true           -- refresh buffer content if there are changes
vim.o.ruler           = true           -- show line number
vim.o.showmode        = true           -- display the current mode on the last line
vim.o.exrc            = true           -- open local config files
vim.o.joinspaces      = false          -- don't add white space when I don't tell you to
vim.o.showmatch       = true           -- ensure Dyck language
vim.o.incsearch       = true           -- incremental searching
vim.o.mouse           = "a"            -- enable the mouse (enables clicking and scrolling)
vim.o.mousehide       = true           -- hides the mouse pointer when typing characters
vim.o.undolevels      = 100            -- the commands that can be stored in for undo
vim.o.history         = 20             -- stores the last 20 ':' commands
vim.o.list            = false          -- tabs are not shown as <TABS> and EOL as <EOL>
vim.o.matchtime       = 2              -- tenths of seconds to show matching pairs
vim.o.splitbelow      = true           -- extra window open below the current window
vim.o.splitright      = true           -- open new splits to right/below
vim.g.netrw_liststyle = 3              -- defaults netrw listing style to tree
vim.o.updatetime      = 50             -- set faster screen updates
vim.o.guicursor       = ''
vim.o.nu              = true
vim.o.relativenumber  = true

------------------------------------------------------------------------------
-- Formatting Options
------------------------------------------------------------------------------

vim.o.colorcolumn   = 99     -- colors single column at line 100 for visual cue
vim.o.autoindent    = true   -- autoindent on
vim.o.formatoptions = "tcrq" -- how to auto indent, see fo-table for description

-- Screw it. 2 SPACES ALL!
vim.o.expandtab  = true
vim.o.shiftwidth = 2
vim.o.tabstop    = 2

vim.o.wrapmargin = 2    -- word wraps 2 character spaces from the margin
vim.o.shiftround = true -- rounds < & > command to the nearest mod of shiftwidth
vim.o.scrolloff  = 12   -- number of lines to keep around cursor

-- do not expand tabs in assembly file -- make them 8 chars wide
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.s" }, callback = function()
	vim.opt_local.expandtab  = false
	vim.opt_local.shiftwidth = 8
	vim.opt_local.tabstop    = 8
end})

-- python pep8 prefers 4 spaces for indentation
autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.py" }, callback = function()
	vim.opt_local.expandtab  = true
	vim.opt_local.shiftround = 4
	vim.opt_local.tabstop    = 4
end})

-- Makefile requires tab character unless you provide a separate recipe file
autocmd({ "BufRead" ,"BufNewFile" }, { pattern = { "[Mm]akefile" }, callback = function()
	vim.opt_local.expandtab = false
end})
autocmd({ "BufNewFile" }, {  pattern = { "[Mm]akefile*" }, callback = function()
	vim.opt_local.formatoptions = croql
	vim.opt_local.comments      = "#"
end})

autocmd({ "BufNewFile" }, { pattern = { ".vimrc,*.vim " }, callback = function()
	vim.opt_local.formatoptions = croql
	vim.opt_local.comments      = "\\"
end})

autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.*" }, callback = function()
	vim.opt_local.spell = true -- turn on spellcheck
end})

------------------------------------------------------------------------------
-- Programming Options
------------------------------------------------------------------------------

vim.o.syntax = 'on'
vim.o.cin    = true
vim.cmd [[
  set omnifunc=syntaxcomplete#Complete
]]

-- code folding!
vim.o.foldmethod  = "indent"
vim.o.foldnestmax = 10
vim.o.foldenable  = false
vim.o.foldlevel   = 2
-- do not open code fold even if it has a search hit
vim.cmd [[
  set foldopen-=search
]]

-- Java options
-- to compile & run leetcode problems in Java
vim.cmd [[
  autocmd Filetype java set makeprg=javac\ %\ &&\ java\ -classpath\ %:h:r:\ %:t:r
]]

------------------------------------------------------------------------------
-- Misc
------------------------------------------------------------------------------

-- ignores files when autocompleting
vim.cmd [[
  set wildchar=<Tab> " character that starts the autocompletion
  set wildmenu       " shows a list of possible autocompletions
  set wildmode=list  " show list and complete the first match
  set nowritebackup  " no intermediate files when saving
  set wildignore=*.so,*.swp,*.swo,*.zip,*.o,*.bak,*.data,*.class
]]

-- highlight current line
vim.cmd [[
  set cursorline
  hi CursorLine cterm=NONE ctermbg=red ctermfg=white guibg=#ed00f5 guifg=white
]]

-- similar to tabonly, this closes all open buffers except current open buffer
vim.cmd [[
command! -nargs=? -complete=buffer -bang Bonly
\ :call Bufonly()
command! -nargs=? -complete=buffer -bang Bufonly
\ :call Bufonly()
function! Bufonly()
execute ':w|%bd|e#'
endfunction
]]
