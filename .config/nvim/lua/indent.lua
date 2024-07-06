local two_space = { "html", "json", "tsx", "jsx", "astro" }

for _, filetype in ipairs(two_space) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = function()
			vim.opt_local.shiftwidth = 2
			vim.opt_local.tabstop = 2
		end,
	})
end

local four_space = { "kt", "java", "py", "ts", "js" }

for _, filetype in ipairs(four_space) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetype,
		callback = function()
			vim.opt_local.shiftwidth = 4
			vim.opt_local.tabstop = 4
		end,
	})
end

-- custom command to use jq to format json files
vim.api.nvim_create_user_command("FmtJson", ":%!jq .", {})
