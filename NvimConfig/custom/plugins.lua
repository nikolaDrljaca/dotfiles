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

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},

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
			},
		},
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
