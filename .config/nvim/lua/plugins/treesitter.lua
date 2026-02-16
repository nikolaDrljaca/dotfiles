local ensure_installed = {
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
	"astro",

	-- JVM
	"java",
	"kotlin",

	-- Misc
	"markdown",
	"markdown_inline",
	"dockerfile",
	"sql",
	"luadoc",
	"vimdoc",
}

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(ensure_installed)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ensure_installed,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
