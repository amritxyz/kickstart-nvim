return {
  'idr4n/github-monochrome.nvim',
  priority = 1000,
  config = function()
    require('github-monochrome').setup {}
    vim.cmd.colorscheme 'github-monochrome-solarized'
  end,
}
