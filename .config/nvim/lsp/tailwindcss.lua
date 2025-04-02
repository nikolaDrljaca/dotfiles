---@type vim.lsp.Config
return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
	},
	filetypes = {
		-- html
		"astro",
		"astro-markdown",
		"html",
		"htmlangular",
		-- js
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		-- mixed
		"vue",
		"svelte",
	},
}
