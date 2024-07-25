return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"go",
				"lua",
				"python",
				"rust",
				"tsx",
				"typescript",
				"vimdoc",
				"vim",

				-- elixir
				"heex",
				"eex",
				"elixir",
				"erlang",

				-- web dev
				"html",
				"css",
				"javascript",
				"tsx",
				"json",

				-- JVM
				"java",
				"kotlin",

				-- Misc
				"markdown",
				"dockerfile",
				"sql",
			},

			indent = { enable = true },
			highlight = { enable = true },
		})
	end,
}
