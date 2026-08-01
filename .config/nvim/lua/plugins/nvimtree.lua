return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 35,
			},
			filters = {
				git_ignored = false,
				dotfiles = false,
			},
		})
	end,
}
