-- Setmaps
vim.g.mapleader = ' '
vim.o.spell = true
vim.o.spelllang = 'en_us'
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
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
vim.opt.listchars = { tab = '· ', trail = '»', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.wrap = false

vim.opt.breakindent = true
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.highlight.priorities.semantic_tokens = 95

-- netrw config
vim.g.netrw_banner = 0 -- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 0 -- change from left splitting to right splitting
vim.g.netrw_liststyle = 3 -- tree style view in netrw
vim.g.netrw_winsize = 70 -- takes up 70% of the screen
vim.g.netrw_sizestyle = 'H'
vim.g.netrw_sort_sequence = [[[\/]$,*]] -- sort directories first
vim.g.netrw_keepdir = 0
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_sizestyle = 'H'
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_localmkdir = 'mkdir -p'
vim.g.netrw_localrmdir = 'rm -r'
vim.g.netrw_compress = 'gzip'
vim.g.netrw_cursor = 2
vim.g.netrw_preview = 0
vim.g.netrw_alto = 1

-- vim.cmd [[autocmd BufNewFile  *.jsx 0r $HOME/.config/nvim/snippets/auto-load/jsx.jsx|normal Gddgg0fC]]

-- vim.opt.tabstop = 8
-- vim.opt.softtabstop = 8
-- vim.opt.shiftwidth = 8

-- vim.g.neovide_background_opacity = 0.9
-- vim.g.neovide_transparency = true
-- vim.g.neovide_background_blur = 4
