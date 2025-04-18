return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
      on_highlights = function(hl, c)
        local prompt = '#1d2021'
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopeResultsTitle = {
          bg = prompt,
          fg = prompt,
        }
      end,
    }

    vim.cmd.colorscheme 'gruvbox'

    -- Set background of Normal and NormalFloat to transparent for minimal look
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  end,
}
