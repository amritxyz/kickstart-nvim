local uv = vim.uv or vim.loop

local THEME_FILE = vim.fn.expand '~/.config/nvim/lua/colors/toggle-theme.lua'

local function read_theme()
  local f = io.open(THEME_FILE, 'r')
  if not f then
    return 'dark'
  end
  local line = f:read '*l'
  f:close()
  return line == 'light' and 'light' or 'dark'
end

local function apply_theme(theme)
  -- Clear previous highlights cleanly
  vim.cmd 'highlight clear'
  vim.opt.background = theme

  if theme == 'light' then
    package.loaded['colors.monochrome-light'] = nil
    require 'colors.monochrome-light'
  else
    package.loaded['colors.monochrome-dark'] = nil
    require 'colors.monochrome-dark'
  end
end

-- Initial apply (startup or SIGHUP reload)
apply_theme(read_theme())

-- ---- File watcher ----

local handle = uv.new_fs_event()

if handle then
  uv.fs_event_start(handle, THEME_FILE, {}, function(err)
    if err then
      return
    end

    vim.schedule(function()
      apply_theme(read_theme())
    end)
  end)
end
