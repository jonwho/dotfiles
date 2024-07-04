local autocmd = vim.api.nvim_create_autocmd

-- toggle NERDTree drawer
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", { noremap = true })

-- find buffer file in NERDTree
vim.keymap.set("n", "<Leader>o", ":NERDTreeFind<CR>", { noremap = true })

-- show hidden files in NERDTree on startup <Shift-i> to toggle
vim.g.NERDTreeShowHidden = true

-- CWD changes whenever the root is changed
vim.g.NERDTreeChDirMode = 2

-- ignore listing these files based off REGEX
vim.g.NERDTreeIgnore = { "\\.class$", "\\.o$" }

-- vim.g.NERDTreeStatusline = -1

vim.cmd([[
  au VimEnter * if !argc() | NERDTree | endif
]])
