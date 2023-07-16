local formatter = {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup {
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				python = {
					require("formatter.filetypes.python").black
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").prettierd
				},
				javascript = {
					require("formatter.filetypes.javascript").prettierd
				},
				javascriptreact = {
					require("formatter.filetypes.javascriptreact").prettierd
				},
				typescript = {
					require("formatter.filetypes.typescript").prettierd
				},
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace
				}
			}
		}
	end
}

return formatter
