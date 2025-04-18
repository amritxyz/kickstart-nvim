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

    local gruvbox = {
      dark0_hard = '#1d2021',
      dark0 = '#282828',
      dark1 = '#3c3836',
      dark2 = '#504945',
      dark3 = '#665c54',
      dark4 = '#7c6f64',
      neutral_red = '#fb4934',
      neutral_orange = '#fe8019',
      neutral_yellow = '#fabd2f',
      neutral_green = '#b8bb26',
      neutral_blue = '#83a598',
      neutral_purple = '#d3869b',
      neutral_aqua = '#8ec07c',
      neutral_gray = '#928374',
    }

    vim.api.nvim_set_hl(0, 'StatusLine', {
      fg = gruvbox.neutral_gray,
      bg = gruvbox.dark0,
      bold = false,
    })

    vim.api.nvim_set_hl(0, 'StatusLineNC', {
      fg = gruvbox.dark1,
      bg = gruvbox.dark0_hard,
      bold = false,
    })

    local mode_colors = {
      Normal = gruvbox.neutral_blue,
      Insert = gruvbox.neutral_green,
      Visual = gruvbox.neutral_purple,
      Replace = gruvbox.neutral_red,
      Command = gruvbox.neutral_orange,
      Other = gruvbox.dark1,
    }

    for mode, color in pairs(mode_colors) do
      vim.api.nvim_set_hl(0, 'MiniStatuslineMode' .. mode, {
        fg = gruvbox.dark0_hard,
        bg = color,
        bold = false,
      })
    end
  end,
}
