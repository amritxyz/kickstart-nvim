return {
  'https://codeberg.org/amrit/modus-themes.nvim.git',
  priority = 1000,
  config = function()
    require('modus-themes').setup {
      style = 'modus_vivendi',
      variant = 'default',

      styles = {
        functions = { italic = true },
      },

      on_colors = function(colors)
        colors.error = colors.red_faint
      end,

      on_highlights = function(highlight, color)
        highlight.Boolean = { fg = color.green }
      end,
    }
    vim.cmd.colorscheme 'modus_vivendi'
  end,
}
