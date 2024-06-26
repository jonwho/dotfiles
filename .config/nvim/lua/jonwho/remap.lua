vim.g.mapleader = "\\"

vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

-- search word under cursor
vim.keymap.set("n", "K", ":Rg <C-R><C-W><CR>", { noremap = true, silent = true })

-- " copy filepath to clipboard
vim.keymap.set("n", "<Leader>cp", ":let @* = expand('%:p')<CR>", { noremap = true, silent = true })
