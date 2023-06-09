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
