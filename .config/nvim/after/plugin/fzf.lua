-- search word under cursor
vim.keymap.set("n", "<leader>K", ":Rg <C-R><C-W><CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<C-f>', ':FZF<cr>', { noremap = true, silent = true })

-- you can actually set ENV vars in a vimrc file
-- this change changes the search command FZF uses to ripgrep
vim.cmd [[
let $FZF_DEFAULT_COMMAND='rg --files --follow --hidden --glob "!{node_modules/*,.git/*,vendor/*}"'
]]

-- replace grep with ripgrep
vim.cmd [[
if executable('rg')
  " use rg over grep
  set grepprg=rg
endif
]]
