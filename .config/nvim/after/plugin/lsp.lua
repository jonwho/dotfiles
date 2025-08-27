vim.lsp.config.gopls = {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			telemetryPrompt = false,
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
	cmd_env = {
		GOTELEMETRY = "off",
		GOPROXY = "direct",
	},
	flags = {
		debounce_text_changes = 150,
	},
}

vim.lsp.enable("gopls")
