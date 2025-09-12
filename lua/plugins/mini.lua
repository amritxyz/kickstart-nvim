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

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'StatusLine', { bold = false })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { fg = '#a89984', bg = '#32302f', bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', { fg = '#1d2021', bg = '#b8bb26', bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeVisual', { fg = '#1d2021', bg = '#fb4934', bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeReplace', { fg = '#1d2021', bg = '#fabd2f', bold = false })
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeCommand', { fg = '#1d2021', bg = '#83a598', bold = false })
  end,
}
