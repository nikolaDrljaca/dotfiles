-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true
vim.o.autoindent = true
vim.o.breakindent = true

-- limit inline popup size to 5 elems
vim.o.pumheight = 5

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- set minimal line space at bottom and top of editod
vim.opt.scrolloff = 10

-- remove tilda
vim.opt.fillchars = { eob = " " }

-- highlight current line
vim.opt.cursorline = true
