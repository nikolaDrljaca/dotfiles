local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				--defaults
				"vim",
				"lua",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"json",
				"svelte",
				"php",

				-- JVM
				"java",
				"kotlin",

				-- Misc
				"markdown",
				"dockerfile",
				"sql",
			},
			indent = { enabled = true },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"tailwindcss-language-server",
				"pyright",
				"typescript-language-server",
				"emmet-ls",
				"eslint-lsp",
				"prettierd",
				"stylua",
				"autopep8",
				"svelte-language-server",
				"rustywind",
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		opts = function()
			return require("custom.configs.null-ls")
		end,
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("custom.configs.todo-comments")
		end,
		lazy = false,
	},
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
		lazy = false,
	},
}
return plugins
