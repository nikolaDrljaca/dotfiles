return {
	"nvim-java/nvim-java",
	config = function()
		require("java").setup({
			java_debug_adapter = {
				enabled = false,
			},
			log = {
				use_console = false,
			},
		})
		vim.lsp.enable("jdtls")
	end,
}
