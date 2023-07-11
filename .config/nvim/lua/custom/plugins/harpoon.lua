local harpoon = {
  'ThePrimeagen/harpoon',
  config = function()
    local harp = require 'harpoon.ui'
    local mark = require 'harpoon.mark'

    vim.keymap.set('n', '<A-h>', harp.toggle_quick_menu)
    vim.keymap.set('n', '<A-m>', mark.add_file)
    vim.keymap.set('n', '<TAB>', harp.nav_next)
    vim.keymap.set('n', '<S-TAB>', harp.nav_prev)
  end,
}

return harpoon
