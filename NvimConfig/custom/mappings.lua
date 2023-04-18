local M = {}

M.custom = {
  n = {
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["<A-j>"] = { ":m .+1<CR>==" },
    ["<A-k>"] = { ":m .-2<CR>==" },
    ["<leader>todo"] = { ":TodoQuickFix <CR>", "List tags from todo-comments" },
  },
  v = {
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

return M
