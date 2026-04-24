local parsers = {
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
	"jsx",
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
	"typst",
}

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		require("nvim-treesitter").install(parsers)
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local buf, filetype = args.buf, args.match
				local language = vim.treesitter.language.get_lang(filetype)
				if not language then
					return
				end

				-- check if parser exists and load it
				if not vim.treesitter.language.add(language) then
					return
				end
				-- enable highlighting and other features
				vim.treesitter.start(buf, language)

				local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil
				-- enable treesitter based indentation
				if has_indent_query then
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
