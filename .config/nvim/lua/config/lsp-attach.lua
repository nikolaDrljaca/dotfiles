-- define function to run on LspAttach event
local on_attach = function(args)
	-- extract buffer number
	local bufnr = args.buf
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

	nmap("<leader>ra", vim.lsp.buf.rename, "[R]en[a]me")
	nmap("ga", vim.lsp.buf.code_action, "[G]oto code [A]ction")
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	nmap("gO", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("<S-k>", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Diagnostic keymaps
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

	-- enable autocompletions
	local client_id = args.data.client_id
	local client = vim.lsp.get_client_by_id(client_id)
	if client == nil then
		return
	end

	-- NOTE: Completion handled by blink.cmp -> check plugin config

	--[[
  -- check for completion support
	if client:supports_method("textDocument/completion") then
	-- enable completions
	  vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
	end
  --]]
end

-- configure LspAttach event
vim.api.nvim_create_autocmd("LspAttach", {
	callback = on_attach,
})

-- autoformatting -> conform is setup in plugins
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({
			bufnr = args.buf,
			lsp_fallback = true,
			quite = true,
		})
	end,
})
