-- set formatting keybind
-- vim.keymap.set("n", "<leader>fm", function()
-- 	require("conform").format()
-- end)

return {
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		-- format_on_save = {
		-- 	timeout_ms = 300,
		-- 	lsp_fallback = true,
		-- },
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "autopep8" },
			javascript = { "prettierd" },
		},
	},
}
