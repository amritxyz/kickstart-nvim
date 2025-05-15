return {
  'idr4n/github-monochrome.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'github-monochrome-solarized'
    vim.cmd.hi 'Comment gui=none'
  end,
}
