return {
  -- 'folke/tokyonight.nvim',
  -- 'ellisonleao/gruvbox.nvim',
  'craftzdog/solarized-osaka.nvim',
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    -- require('tokyonight').setup {
    -- require('gruvbox').setup {
    require('solarized-osaka').setup {
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
      on_highlights = function(hl, c)
        local prompt = '#2d3149'
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = c.bg_dark,
        }
        hl.TelescopePromptBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    }
    -- vim.cmd.colorscheme 'tokyonight'
    -- vim.cmd.colorscheme 'gruvbox'
    vim.cmd.colorscheme 'solarized-osaka'
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  end,
}
