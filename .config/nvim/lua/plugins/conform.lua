-- set formatting keybind
-- vim.keymap.set("n", "<leader>fm", function()
-- 	require("conform").format()
-- end)

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_fallback = "fallback" })
			end,
		},
		mode = "",
		desc = "Format bufffer",
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		notify_on_error = true,
		format_on_save = {
			timeout_ms = 300,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			css = { "deno_fmt" },
			html = { "deno_fmt" },
			javascript = { "deno_fmt" },
			typescript = { "deno_fmt" },
			json = { "deno_fmt" },
			jsonc = { "deno_fmt" },
			javascriptreact = { "deno_fmt" },
			typescriptreact = { "deno_fmt" },
			markdown = { "deno_fmt" },
		},
	},
}
