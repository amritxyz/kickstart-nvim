-- monochrome.lua

local M = {}

local c = {
  -- Backgrounds
  bg0 = '#ffffff', -- main background
  bg1 = '#f2f2f2', -- panels / cursorline
  bg2 = '#e6e6e6',
  bg3 = '#d9d9d9',
  bg4 = '#cccccc',

  -- Foregrounds
  fg0 = '#1a1a1a', -- main text
  fg1 = '#000000', -- strong emphasis
  fg2 = '#333333',
  fg3 = '#595959',
  fg4 = '#7f7f7f',

  -- Accent (same hue as dark)
  blue = '#004ef7',

  -- Semantic colors (kept neutral)
  red = '#a12626',
  yellow = '#8a5a00',
  green = '#2d6a2d',
  aqua = '#00538b',
  purple = '#5a2d82',
  orange = '#7a3e00',

  -- Greys
  grey0 = '#7f7f7f',
  grey1 = '#595959',
  grey2 = '#404040',

  -- Diff backgrounds
  bg_diff_green = '#e6f0e6',
  bg_diff_red = '#f2e2e2',
  bg_diff_blue = '#e2ecf2',

  -- Visual / selection
  bg_visual = '#c0c0c0',

  bg_dim = '#f2f2f2',
  bg_current_word = '#d9d9d9',
}

-- Safe highlight function
local function hi(group, fg, bg, attr, sp)
  local cmd = 'hi ' .. group
  if fg then
    cmd = cmd .. ' guifg=' .. fg
  end
  if bg then
    cmd = cmd .. ' guibg=' .. bg
  end
  if attr then
    cmd = cmd .. ' gui=' .. attr
  end
  if sp then
    cmd = cmd .. ' guisp=' .. sp
  end
  vim.cmd(cmd)
end

-- Reset highlight
vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

-- vim.o.termguicolors = true
-- vim.o.background = 'dark'
-- vim.g.colors_name = 'gruvbox'

hi('Normal', c.fg0, c.bg0)
hi('LineNr', c.grey1, c.bg0)
hi('CursorLineNr', c.fg1, c.bg1, 'bold')
hi('CursorLine', nil, c.bg1)
hi('Visual', nil, c.bg_visual)

hi('StatusLine', c.fg2, c.bg1)
hi('StatusLineNC', c.grey1, c.bg1)
hi('VertSplit', c.bg3, c.bg0)
hi('WinSeparator', c.bg3, c.bg0)

hi('Pmenu', c.fg0, c.bg1)
hi('PmenuSel', c.bg0, c.blue, 'bold')

-- === Syntax groups ===
hi('Keyword', c.blue)
hi('Conditional', c.blue)
hi('Repeat', c.blue)
hi('Statement', c.blue)

hi('Function', c.fg1)
hi('Identifier', c.fg0)
hi('Type', c.fg2)

hi('String', c.fg2)
hi('Comment', c.grey1, nil, 'italic')

hi('Number', c.purple)
hi('Boolean', c.purple)
hi('Constant', c.purple)

hi('Operator', c.fg0)
hi('PreProc', c.aqua)
hi('Special', c.orange)

-- === Diagnostics ===
hi('DiagnosticError', c.red)
hi('DiagnosticWarn', c.yellow)
hi('DiagnosticInfo', c.blue)
hi('DiagnosticHint', c.aqua)

hi('DiagnosticUnderlineError', nil, nil, 'undercurl', c.red)
hi('DiagnosticUnderlineWarn', nil, nil, 'undercurl', c.yellow)
hi('DiagnosticUnderlineInfo', nil, nil, 'undercurl', c.blue)
hi('DiagnosticUnderlineHint', nil, nil, 'undercurl', c.aqua)

-- === TODO/INFO/NOTE ===
hi('TodoHighlight', c.bg1, c.yellow, 'bold')
hi('FixHighlight', c.bg1, c.red, 'bold')
hi('NoteHighlight', c.bg1, c.green, 'bold')
hi('InfoHighlight', c.bg1, c.orange, 'bold')
vim.cmd [[
  augroup HighlightCommentsKeywords
    autocmd!
    autocmd BufEnter,BufReadPost * call matchadd("TodoHighlight", "\\v\\s*TODO:")
    autocmd BufEnter,BufReadPost * call matchadd("FixHighlight", "\\v\\s*FIX:")
    autocmd BufEnter,BufReadPost * call matchadd("NoteHighlight", "\\v\\s*NOTE:")
    autocmd BufEnter,BufReadPost * call matchadd("InfoHighlight", "\\v\\s*INFO:")
  augroup END
]]

-- Spelling corrections
hi('SpellBad', nil, nil, 'undercurl', c.red) -- Wrong word
hi('SpellCap', nil, nil, 'undercurl', c.blue) -- Capitalization
hi('SpellRare', nil, nil, 'undercurl', c.purple) -- Rare word
hi('SpellLocal', nil, nil, 'undercurl', c.aqua) -- Locale/region specific

-- === Search & Match ===
hi('Search', c.bg0, c.blue, 'bold')
hi('IncSearch', c.bg0, c.blue, 'bold')
hi('CurSearch', c.bg0, c.blue, 'bold')
hi('MatchParen', nil, c.bg3, 'bold')

-- === Diff / Git ===
hi('DiffAdd', c.green, c.bg_diff_green)
hi('DiffChange', c.blue, c.bg_diff_blue)
hi('DiffDelete', c.red, c.bg_diff_red)

hi('GitSignsAdd', c.green, c.bg0)
hi('GitSignsChange', c.blue, c.bg0)
hi('GitSignsDelete', c.red, c.bg0)

-- === Tabs & Splits ===
hi('TabLine', c.fg0, c.bg1)
hi('TabLineSel', c.bg0, c.blue, 'bold')
hi('TabLineFill', c.grey1, c.bg0)
hi('WinSeparator', c.bg3, c.bg0) -- Similar to VertSplit

-- === Whitespace / misc ===
hi('NonText', c.grey1)
hi('SpecialKey', c.grey1)
hi('Whitespace', c.grey1)
hi('EndOfBuffer', c.bg0)

-- === Popup / Completion ===
hi('PmenuSbar', nil, c.bg2) -- Slightly different shade for scrollbar
hi('PmenuThumb', nil, c.grey1)

-- === Cursor / selections ===
hi('Cursor', c.bg0, c.fg1) -- Invert cursor
hi('TermCursor', c.bg0, c.fg1)
hi('TermCursorNC', c.bg1, c.grey1) -- Dimmed for non-current

-- === Telescope highlights ===
-- Adjusted backgrounds to match gruvbox material scheme
hi('TelescopeNormal', c.fg0, nil)
hi('TelescopeBorder', c.bg3, nil)
-- hi('TelescopePromptNormal', c.fg0, c.bg1)
-- hi('TelescopePromptBorder', c.blue, c.bg1)
hi('TelescopePromptPrefix', c.orange, nil)
hi('TelescopeSelection', c.fg0, c.bg2, 'bold')
hi('TelescopeSelectionCaret', c.red, c.bg2, 'bold')
hi('TelescopeMatching', c.yellow)
hi('TelescopeMultiSelection', c.aqua)
hi('TelescopeTitle', c.blue, c.bg0, 'bold')
hi('TelescopePreviewTitle', c.aqua, nil, 'bold')
hi('TelescopePromptTitle', c.green, nil, 'bold')
hi('TelescopeResultsTitle', c.fg0, nil, 'bold')

vim.cmd [[
  hi! link Function      Identifier
  hi! link Keyword       Keyword
  hi! link Conditional   Keyword
  hi! link Repeat        Keyword
  hi! link Boolean       Constant
  hi! link Float         Number
  hi! link Character     String
  hi! link Macro         PreProc
  hi! link PreCondit     PreProc
  hi! link StorageClass  Type
  hi! link Structure     Type
  hi! link Typedef       Type
  hi! link Tag           Identifier
  hi! link SpecialChar   Special
  hi! link Delimiter     Normal
  hi! link SpecialComment Comment
  hi! link Ignore        Comment
  hi! link Conceal       Normal
  hi! link StatusLineTerm   StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link FoldColumn    SignColumn
]]

-- Treesitter overrides (adjusted for Gruvbox Material feel)
local treesitter = {
  ['@keyword'] = c.blue,
  ['@conditional'] = c.blue,
  ['@repeat'] = c.blue,
  ['@function'] = c.fg1,
  ['@function.builtin'] = c.aqua,
  ['@type'] = c.fg2,
  ['@variable'] = c.fg0,
  ['@constant'] = c.purple,
  ['@string'] = c.fg2,
  ['@comment'] = c.grey1,
  ['@number'] = c.purple,
  ['@boolean'] = c.purple,
  ['@field'] = c.fg0,
  ['@parameter'] = c.fg0,
  ['@operator'] = c.fg0,
}

for group, color in pairs(treesitter) do
  hi(group, color)
end

hi('LspReferenceText', nil, c.base02, 'none')
hi('LspReferenceRead', nil, c.base02, 'none')
hi('LspReferenceWrite', nil, c.base02, 'none')

return M
