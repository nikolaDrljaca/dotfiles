local file_extensions = {
	html = 2,
	json = 2,
	typescriptreact = 2,
	astro = 2,
	lua = 2,
	kt = 4,
	java = 4,
	python = 4,
	typescript = 4,
	javascript = 4,
}

for ext, width in pairs(file_extensions) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = ext,
		callback = function()
			vim.opt_local.shiftwidth = width
			vim.opt_local.tabstop = width
			vim.opt_local.expandtab = true
		end,
	})
end

-- custom command to use jq to format json files
vim.api.nvim_create_user_command("FmtJson", ":%!jq .", {})
