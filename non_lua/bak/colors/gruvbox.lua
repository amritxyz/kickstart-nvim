-- gruvbox.lua

local M = {}

local c = {
  -- Backgrounds
  bg0 = '#FAEBD7', -- main background
  bg1 = '#F3E2C7', -- subtle panels
  bg2 = '#EAD6B8',
  bg3 = '#DFC8A6',
  bg4 = '#D3BB94',

  -- Foregrounds
  fg0 = '#222222', -- main text
  fg1 = '#000000', -- strong emphasis
  fg2 = '#444444',
  fg3 = '#666666',
  fg4 = '#808080',

  -- ANSI colors (mapped from foot)
  red = '#7f1010',
  green = '#808000',
  yellow = '#813e00',
  blue = '#0186C7',
  purple = '#721045',
  aqua = '#00538b',
  orange = '#813e00',

  -- Greys
  grey0 = '#808080',
  grey1 = '#666666',
  grey2 = '#444444',

  -- Diff / highlights
  bg_diff_green = '#E6EDD6',
  bg_diff_red = '#F2D6D6',
  bg_diff_blue = '#D6E6F2',

  bg_visual_red = '#E8C4C4',
  bg_visual_yellow = '#E8D8B8',

  bg_dim = '#F3E2C7',
  bg_current_word = '#DFC8A6',
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

-- === UI Elements ===
hi('Normal', c.fg0, 'none')
hi('LineNr', c.grey1, c.bg1)
hi('CursorLineNr', c.fg1, c.bg1, 'bold')
hi('StatusLine', c.grey2, c.bg1)
hi('StatusLineNC', c.grey1, c.bg1)
hi('VertSplit', c.bg3, c.bg0) -- Adjusted for contrast
hi('Folded', c.grey1, c.bg1)
hi('SignColumn', nil, c.bg0) -- Often same as Normal bg or slightly different
hi('ColorColumn', nil, c.bg1)
hi('CursorLine', nil, c.bg1)
hi('Visual', nil, c.bg4) -- Often uses a darker background
hi('Pmenu', c.fg1, c.bg1)
hi('PmenuSel', c.bg0, c.blue, 'bold') -- Inverted for selection
hi('WildMenu', c.bg0, c.yellow, 'bold') -- Inverted for emphasis
hi('ErrorMsg', c.red, nil, 'bold')
hi('WarningMsg', c.yellow) -- Changed to yellow for warning
hi('Title', c.blue, nil, 'bold')

-- === Syntax groups ===
hi('cInclude', c.purple) -- PreProc like include
hi('Keyword', c.red)
hi('Conditional', c.red)
hi('Repeat', c.red)
hi('Statement', c.red)
-- hi('Keyword', c.red) -- Duplicate, removed
hi('Function', c.green) -- Function names
hi('Identifier', c.blue) -- variables, parameters, methods
hi('Type', c.yellow) -- types, classes
hi('String', c.green) -- Gruvbox often uses green for strings
hi('Comment', c.grey1)
hi('Operator', c.fg0) -- Operators often match fg or are subtle
hi('Constant', c.purple) -- true, false, nil, numbers
hi('PreProc', c.aqua) -- #include, #define, etc.
hi('Special', c.orange) -- built-ins, meta
hi('Number', c.purple)
hi('Boolean', c.purple)
hi('Tag', c.aqua)
hi('Underlined', c.fg1, nil, 'underline')

-- === Diagnostics ===
hi('DiagnosticError', c.red)
hi('DiagnosticWarn', c.yellow)
hi('DiagnosticInfo', c.blue) -- Changed to blue for info
hi('DiagnosticHint', c.aqua) -- Changed to aqua for hint

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

-- Diagnostic signs in gutter
hi('DiagnosticSignError', c.red, c.bg1)
hi('DiagnosticSignWarn', c.yellow, c.bg1)
hi('DiagnosticSignInfo', c.blue, c.bg1)
hi('DiagnosticSignHint', c.aqua, c.bg1)

-- === Undercurl diagnostics ===
hi('DiagnosticUnderlineError', nil, nil, 'undercurl', c.red)
hi('DiagnosticUnderlineWarn', nil, nil, 'undercurl', c.yellow)
hi('DiagnosticUnderlineInfo', nil, nil, 'undercurl', c.blue)
hi('DiagnosticUnderlineHint', nil, nil, 'undercurl', c.aqua)

-- Spelling corrections
hi('SpellBad', nil, nil, 'undercurl', c.red) -- Wrong word
hi('SpellCap', nil, nil, 'undercurl', c.blue) -- Capitalization
hi('SpellRare', nil, nil, 'undercurl', c.purple) -- Rare word
hi('SpellLocal', nil, nil, 'undercurl', c.aqua) -- Locale/region specific

-- === Search & Match ===
hi('Search', c.bg0, c.yellow, 'bold')
hi('IncSearch', c.bg0, c.orange, 'bold')
hi('CurSearch', c.bg0, c.red, 'bold')
hi('MatchParen', nil, c.bg3, 'bold') -- Highlight background for match

-- === Diff / Git ===
hi('DiffAdd', c.green, c.bg_diff_green) -- Use green foreground and greenish bg
hi('DiffChange', c.blue, c.bg_diff_blue) -- Use blue foreground and blueish bg
hi('DiffDelete', c.red, c.bg_diff_red) -- Use red foreground and reddish bg
hi('DiffText', c.fg0, c.bg4, 'bold') -- Changed to use a distinct background
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
  ['@keyword'] = c.red,
  ['@conditional'] = c.red,
  ['@repeat'] = c.red,
  ['@operator'] = c.fg0, -- Use main fg or a subtle color
  ['@function'] = c.green,
  ['@function.builtin'] = c.aqua, -- Often aqua for built-ins
  ['@type'] = c.yellow,
  ['@variable'] = c.fg0,
  ['@constant'] = c.purple,
  ['@string'] = c.green,
  ['@comment'] = c.grey1,
  ['@number'] = c.purple,
  ['@boolean'] = c.purple,
  ['@field'] = c.blue, -- Fields often blue
  ['@attribute'] = c.aqua, -- Attributes often aqua
  ['@namespace'] = c.aqua,
  ['@parameter'] = c.blue, -- Parameters often blue
  ['@punctuation.bracket'] = c.fg0, -- Match main fg
  ['@punctuation.delimiter'] = c.fg0, -- Match main fg
  ['@constructor'] = c.yellow, -- Constructors often yellow/type
}

for group, color in pairs(treesitter) do
  hi(group, color)
end

hi('LspReferenceText', nil, c.base02, 'none')
hi('LspReferenceRead', nil, c.base02, 'none')
hi('LspReferenceWrite', nil, c.base02, 'none')

return M
