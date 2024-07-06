-- Custom command to Install binaries from Mason Registry
vim.api.nvim_create_user_command("MasonInstallAll", function()
	local registry = require("mason-registry")
	local mason_ensure_installed = {
		-- language servers
		"tailwindcss-language-server",
		"typescript-language-server",
		"emmet-ls",
		"lua-language-server",
		"pyright",
		"gopls",
		"astro-language-server",
		"lexical",
		"svelte-language-server",

		-- formatters
		"prettierd",
		"stylua",
		"rustywind", -- tailwind formatter
		"autopep8",

		-- linters
		"eslint_d",
	}
	-- bring up the Mason UI
	vim.cmd("Mason")
	-- update the registry
	registry.refresh()
	-- loop over specified packages and install the ones not installed
	for _, v in pairs(mason_ensure_installed) do
		local package = registry.get_package(v)
		if not package:is_installed() then
			package:install()
		end
	end
end, {})

return {
	"williamboman/mason.nvim",
	opts = {
		ui = {
			border = "rounded",
		},
	},
}
