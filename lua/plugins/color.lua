return {
  'idr4n/github-monochrome.nvim',
  priority = 1000,
  config = function()
    require('github-monochrome').setup {}
    vim.cmd.colorscheme 'github-monochrome-solarized'
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  end,
}
