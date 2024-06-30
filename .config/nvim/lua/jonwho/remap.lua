vim.g.mapleader = "\\"
vim.g.maplocalleader = " "

vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

-- " copy filepath to clipboard
vim.keymap.set("n", "<Leader>cp", ":let @* = expand('%:p')<CR>", { noremap = true, silent = true })

-- toggle the cursor highlight with <Leader>c
vim.cmd [[ nnoremap <Leader>c :set cursorline! cursorcolumn!<CR> ]]

-- insert current datetime
vim.keymap.set('n', '<Leader>D', ":put =strftime('[%a %Y-%m-%d %H:%M:%S%z]')<CR>")
