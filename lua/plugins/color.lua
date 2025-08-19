return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  init = function()
    require('gruvbox').setup {
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true,
      contrast = 'soft',
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    }
    vim.cmd.colorscheme 'gruvbox'
    vim.cmd.hi 'Comment gui=none'
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', fg = '#ebdbb2' })
  end,
}
