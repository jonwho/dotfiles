require'nvim-treesitter.configs'.setup {
	auto_install = true,

	highlight = { enable = true, },
	endwise = { enable = true },

	additional_vim_regex_highlighting = false,
}

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldcolumn = '0'
