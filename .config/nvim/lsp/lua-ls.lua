---@type vim.lsp.Config
return {
	cmd = { "lua-language-server" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	filetypes = { "lua" },
	single_file_support = true,
	telemetry = { enable = false },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = {
				disable = { "lowercase-global" },
			},
			workspace = {
				checkThirdParty = false,
			},
		},
	},
}
