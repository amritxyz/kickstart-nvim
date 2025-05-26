return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()

    local statusline = require 'mini.statusline'
    statusline.setup {
      use_icons = false,
    }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { fg = '#1d2021', bg = '#a89984', bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', { fg = '#1d2021', bg = '#a9b665', bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual', { fg = '#1d2021', bg = '#ea6962', bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeReplace', { fg = '#1d2021', bg = '#d8a657', bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', { fg = '#1d2021', bg = '#7daea3', bold = false })
  end,
}
