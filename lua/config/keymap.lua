-- Keymaps
vim.keymap.set('n', '<C-s>', '<cmd>set spell!<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>v', ':vsplit <C-r>=expand("%:p:h").."/"<CR>', { silent = false })
vim.keymap.set('n', '<leader>b', ':split <C-r>=expand("%:p:h").."/"<CR>', { silent = false })
vim.keymap.set('n', '<leader>ss', ':%s//g<Left><Left>', { noremap = true, silent = false })

vim.keymap.set('n', '<leader>dl', ':LspStop<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>el', ':LspStart<CR>', { noremap = true, silent = false })

vim.keymap.set('n', '<leader>li', ':0r ~/.config/nvim/non_lua/f_license_snippets/<C-d>', { silent = true })
vim.keymap.set('n', '<leader>lI', ':0r ~/.config/nvim/non_lua/og_license_snippets/<C-d>', { silent = true })

vim.cmd 'autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'

vim.keymap.set('n', '<leader>c', function()
  vim.cmd 'write!'
  vim.cmd('!compiler "' .. vim.fn.expand '%:p' .. '"')
end, { noremap = true, silent = true })
