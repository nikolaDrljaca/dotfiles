---@type vim.lsp.Config
return {
	cmd = { "emmet-ls", "--stdio" },
	single_file_support = true,
	root_markers = { ".git" },
	filetypes = {
		"astro",
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"sass",
		"scss",
		"svelte",
		"typescriptreact",
		"vue",
		"htmlangular",
	},
	settings = {
		init_options = {
			jsx = {
				options = {
					["jsx.enabled"] = true,
				},
			},
		},
	},
}
