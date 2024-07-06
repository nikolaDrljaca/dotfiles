local harpoon = {
  'ThePrimeagen/harpoon',
  lazy = false,
  -- Config
  config = function()
    local harp = require 'harpoon.ui'
    local mark = require 'harpoon.mark'

    local add = function ()
      mark.add_file()
      print "Added to Harpoon!"
    end

    vim.keymap.set('n', '<A-h>', harp.toggle_quick_menu)
    vim.keymap.set('n', '<A-m>', add)
    vim.keymap.set('n', '<TAB>', harp.nav_next)
    vim.keymap.set('n', '<S-TAB>', harp.nav_prev)
  end,
}

return harpoon
