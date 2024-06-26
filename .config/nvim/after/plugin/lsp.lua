-- Order of LSP setup matters.

local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

require('lspconfig').lua_ls.setup({})

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({
		buffer = bufnr,
		preserve_mappings = false,
	})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls',
	},
	handlers = {
		--- this first function is the "default handler"
		--- it applies to every language server without a "custom handler"
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,

		--- this is the "custom handler" for `example_server`
		--- in your own config you should replace `example_server`
		--- with the name of a language server you have installed
		-- example_server = function()
		--   --- in this function you can setup
		--   --- the language server however you want.
		--   --- in this example we just use lspconfig
		--
		--   require('lspconfig').example_server.setup({
		--     ---
		--     -- in here you can add your own
		--     -- custom configuration
		--     ---
		--   })
		-- end,
	},
})
