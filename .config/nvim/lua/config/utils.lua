function gen_uuid()
	local uuid = vim.fn.trim(vim.fn.system("uuidgen"))
	vim.api.nvim_put({ uuid }, "c", true, true)
end

vim.api.nvim_create_user_command("Uuid", gen_uuid, { nargs = 0 })
