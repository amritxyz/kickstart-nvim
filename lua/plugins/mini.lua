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

    local solarized = {
      base03 = '#002b36',
      base02 = '#073642',
      base01 = '#586e75',
      base00 = '#657b83',
      base0 = '#839496',
      base1 = '#93a1a1',
      base2 = '#eee8d5',
      base3 = '#fdf6e3',
      yellow = '#b58900',
      orange = '#cb4b16',
      red = '#dc322f',
      magenta = '#d33682',
      violet = '#6c71c4',
      blue = '#268bd2',
      cyan = '#2aa198',
      green = '#859900',
    }

    vim.api.nvim_set_hl(0, 'StatusLine', {
      fg = solarized.base0,
      bg = solarized.base02,
      bold = false,
    })

    vim.api.nvim_set_hl(0, 'StatusLineNC', {
      fg = solarized.base01,
      bg = solarized.base03,
      bold = false,
    })

    local mode_colors = {
      Normal = solarized.blue,
      Insert = solarized.green,
      Visual = solarized.magenta,
      Replace = solarized.red,
      Command = solarized.orange,
      Other = solarized.base01,
    }

    for mode, color in pairs(mode_colors) do
      vim.api.nvim_set_hl(0, 'MiniStatuslineMode' .. mode, {
        fg = solarized.base03,
        bg = color,
        bold = false,
      })
    end
  end,
}
