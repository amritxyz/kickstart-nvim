return {
  'sainnhe/gruvbox-material',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'gruvbox-material'
    vim.cmd.hi 'Comment gui=none'
  end,
}
