require 'config.set'
require 'config.keymap'
require 'config.undercurl'
require 'config.api'
require 'config.extras'
-- require 'modus-themes.init'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth',
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  { import = 'plugins' }, -- [ lua/plugins ]
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

local uv = vim.loop
local STATE_FILE = vim.fn.expand '~/.config/nvim/modus_state'

-- Read current state from file (default to light)
local function read_state()
  local f = io.open(STATE_FILE, 'r')
  if not f then
    return 'light'
  end
  local line = f:read '*l'
  f:close()
  return line == 'dark' and 'dark' or 'light'
end

-- Write state to file
local function write_state(state)
  local f = io.open(STATE_FILE, 'w')
  if f then
    f:write(state)
    f:close()
  end
end

-- Apply colorscheme based on state
local function apply_theme(state)
  vim.cmd 'highlight clear'
  if state ~= 'light' then
    vim.opt.background = 'light'
    vim.cmd.colorscheme 'modus_operandi'
  else
    vim.opt.background = 'dark'
    vim.cmd.colorscheme 'modus_vivendi'
  end
end

-- Toggle between light/dark
local function toggle_theme()
  local current = read_state()
  local next_state = current == 'light' and 'dark' or 'light'
  apply_theme(next_state)
  write_state(next_state)
end

-- Initial apply at startup
apply_theme(read_state())

-- ---- File watcher ----
local handle = uv.new_fs_event()
if handle then
  uv.fs_event_start(handle, STATE_FILE, {}, function(err)
    if err then
      return
    end
    vim.schedule(function()
      apply_theme(read_state())
    end)
  end)
end

-- ---- Signal listener ----
local sig = uv.new_signal()
sig:start('sigusr1', vim.schedule_wrap(toggle_theme))

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
