-- Setmaps
vim.g.mapleader = ' '
vim.o.spell = true
vim.o.spelllang = 'en_us'
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ''
vim.keymap.set('n', '<leader>o', vim.cmd.Tex)
vim.opt.showmode = false
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.wrap = false

vim.opt.breakindent = true
vim.opt.expandtab = false
vim.opt.smartindent = true
-- vim.opt.tabstop = 8
-- vim.opt.softtabstop = 8
-- vim.opt.shiftwidth = 8
