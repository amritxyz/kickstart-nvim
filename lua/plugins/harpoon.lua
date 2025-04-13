return {
  'ThePrimeagen/harpoon',

  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    -- Key mappings for Harpoon
    vim.keymap.set('n', '<leader>a', mark.add_file)
    vim.keymap.set('n', '<C-a>', ui.toggle_quick_menu)

    -- Navigation keys
    vim.keymap.set('n', '<leader>j', function()
      ui.nav_file(1)
    end)
    vim.keymap.set('n', '<leader>k', function()
      ui.nav_file(2)
    end)
    vim.keymap.set('n', '<leader>h', function()
      ui.nav_file(3)
    end)
    vim.keymap.set('n', '<leader>l', function()
      ui.nav_file(4)
    end)
  end,
}
