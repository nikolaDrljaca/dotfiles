return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",

	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{
			"williamboman/mason.nvim",
			config = true,
		},

		"williamboman/mason-lspconfig.nvim",

		-- Useful status updates for LSP
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",
	},

	config = function()
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

			nmap("<leader>ra", vim.lsp.buf.rename, "[R]en[a]me")
			nmap("<A-CR>", vim.lsp.buf.code_action, "[C]ode [A]ction")

			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			-- See `:help K` for why this keymap
			nmap("<S-k>", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Lesser used LSP functionality
			nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
			nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[W]orkspace [L]ist Folders")
		end

		-- configure LspAttach event
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = on_attach,
		})

		-- Setup neovim lua configuration
		require("neodev").setup()

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		--  THIS IS ONLY FOR LSPs
		--  if you wish to supply additional configuration options to the LSP
		--  regardless if it is here or not, it will be attached to the buffer.
		local servers = {
			ts_ls = {
				root_dir = require("lspconfig.util").root_pattern("package.json"),
			},
			tailwindcss = {},
			emmet_ls = {},
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					diagnostics = { disable = { "missing-fields" } },
				},
			},
			gopls = {
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
				},
			},
			lexical = {
				cmd = { "/home/nikola/.local/share/nvim/mason/bin/lexical", "server" },
				root_dir = require("lspconfig.util").root_pattern({ "mix.exs" }),
				filetypes = { "elixir", "eelixir", "heex" },
				settings = {},
			},
			denols = {
				root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
			},
		}

		-- invoke setup on all servers in [servers] table
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
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
	end,
}
