local M = {}

M.custom = {
	n = {
		["<C-d>"] = { "<C-d>zz" },
		["<C-u>"] = { "<C-u>zz" },
		["<C-l>"] = { "<S-v>yp" },
		["<A-j>"] = { ":m .+1<CR>==" },
		["<A-k>"] = { ":m .-2<CR>==" },
		["<leader>todo"] = { ":TodoQuickFix <CR>", "List tags from todo-comments" },
		["<leader>z"] = { ":NoNeckPain <CR>", "Center on screen buffer" },
		["<S-e>"] = { "$", "Jump to end of line." },
		["<S-b>"] = { "_", "Jump to front of line." },
		["<S-j>"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic window for LSP.",
		},
	},
	v = {
		["<C-d>"] = { "<C-d>zz" },
		["<C-u>"] = { "<C-u>zz" },
		["<A-j>"] = { ":m '>+1<CR>gv=gv" },
		["<A-k>"] = { ":m '<-2<CR>gv=gv" },
		["<S-e>"] = { "$", "Jump to end of line." },
		["<S-b>"] = { "_", "Jump to front of line." },
	},
	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},
}

return M
