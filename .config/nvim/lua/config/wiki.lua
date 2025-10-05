function open_wiki()
	local filepath = "~/personal/wiki/index.md"
	vim.cmd("tabnew " .. vim.fn.fnameescape(filepath))
end

vim.keymap.set("n", "<leader>ww", open_wiki, { desc = "Open wiki." })

vim.api.nvim_create_user_command("Wiki", open_wiki, { nargs = 0 })
