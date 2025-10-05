-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: Disable netrw to make nvimtree work
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.wiki")
-- remaps
require("config.keymaps")
-- lazy -> load plugins
require("config.lazy")
-- enable LSPs
require("config.lsp-enable")
-- load configs
require("config.vim-opts")
require("config.lsp-attach")
