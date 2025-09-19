-- solarized-dark.lua

local M = {}

-- Solarized Dark palette
local c = {
  base03 = '#002b36',
  base02 = '#073642',
  base01 = '#586e75',
  base00 = '#657b83',
  base0 = '#839496',
  base1 = '#93a1a1',
  base2 = '#eee8d5',
  base3 = '#fdf6e3',
  yellow = '#a57c00',
  orange = '#a65a2e',
  red = '#b83838',
  magenta = '#b8488a',
  violet = '#5e66b8',
  blue = '#268bd2',
  cyan = '#2a9c96',
  green = '#7c9000',
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
-- vim.g.colors_name = 'solarized-dark-kakoune'

-- === UI Elements ===
hi('Normal', c.base0, c.base03)
hi('LineNr', c.base01, c.base02)
hi('CursorLineNr', c.base1, c.base02, 'bold')
hi('StatusLine', c.base1, c.base02)
hi('StatusLineNC', c.base00, c.base02)
hi('VertSplit', c.base02, c.base02)
hi('Folded', c.base01, c.base02)
hi('SignColumn', nil, c.base02)
hi('ColorColumn', nil, c.base02)
hi('CursorLine', nil, c.base02)
hi('Visual', nil, '#30525c')
hi('Pmenu', c.base1, c.base02)
hi('PmenuSel', c.base03, c.yellow, 'bold')
hi('WildMenu', c.base03, c.yellow, 'bold')
hi('ErrorMsg', c.red, nil, 'bold')
hi('WarningMsg', c.red)
hi('Title', c.blue, nil, 'bold')

-- === Syntax groups ===
hi('cInclude', c.green)
hi('Keyword', c.green)
hi('Conditional', c.green)
hi('Repeat', c.green)
hi('Statement', c.green)
hi('Keyword', c.green) -- if, for, return, end, function, local
hi('Function', c.blue) -- function names
hi('Identifier', c.blue) -- variables, parameters, methods
hi('Type', c.yellow) -- types, classes
hi('String', c.cyan)
hi('Comment', c.base01)
hi('Operator', c.green) -- =, +, -, etc.
hi('Constant', c.violet) -- true, false, nil, numbers
hi('PreProc', c.orange) -- #include, #define, etc.
hi('Special', c.orange) -- built-ins, meta
hi('Number', c.violet)
hi('Boolean', c.violet)
hi('Tag', c.cyan)
hi('Underlined', c.base1, nil, 'underline')

-- === Diagnostics ===
hi('DiagnosticError', c.red)
hi('DiagnosticWarn', c.yellow)
hi('DiagnosticInfo', c.cyan)
hi('DiagnosticHint', c.green)

-- === TODO/INFO/NOTE ===
hi('TodoHighlight', c.yellow, c.base03, 'bold')
hi('FixHighlight', c.red, c.base03, 'bold')
hi('NoteHighlight', c.green, c.base03, 'bold')
hi('InfoHighlight', c.orange, c.base03, 'bold')
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
hi('DiagnosticSignError', c.red, c.base02)
hi('DiagnosticSignWarn', c.yellow, c.base02)
hi('DiagnosticSignInfo', c.cyan, c.base02)
hi('DiagnosticSignHint', c.green, c.base02)

-- === Undercurl diagnostics ===
hi('DiagnosticUnderlineError', nil, nil, 'undercurl', c.red)
hi('DiagnosticUnderlineWarn', nil, nil, 'undercurl', c.yellow)
hi('DiagnosticUnderlineInfo', nil, nil, 'undercurl', c.cyan)
hi('DiagnosticUnderlineHint', nil, nil, 'undercurl', c.green)

-- Spelling corrections
hi('SpellBad', nil, nil, 'undercurl', c.red) -- Wrong word
hi('SpellCap', nil, nil, 'undercurl', c.blue) -- Capitalization
hi('SpellRare', nil, nil, 'undercurl', c.violet) -- Rare word
hi('SpellLocal', nil, nil, 'undercurl', c.cyan) -- Locale/region specific

-- === Search & Match ===
hi('Search', c.base03, c.yellow, 'bold')
hi('IncSearch', c.base03, c.orange, 'bold')
hi('CurSearch', c.base03, c.red, 'bold')
hi('MatchParen', c.red, c.base02, 'bold')

-- === Diff / Git ===
hi('DiffAdd', c.green, c.base02)
hi('DiffChange', c.yellow, c.base02)
hi('DiffDelete', c.red, c.base02)
hi('DiffText', c.orange, c.base02, 'bold')
hi('GitSignsAdd', c.green, c.base02)
hi('GitSignsChange', c.yellow, c.base02)
hi('GitSignsDelete', c.red, c.base02)

-- === Tabs & Splits ===
hi('TabLine', c.base0, c.base02)
hi('TabLineSel', c.base03, c.blue, 'bold')
hi('TabLineFill', c.base01, c.base02)
hi('WinSeparator', c.base01, c.base02)

-- === Whitespace / misc ===
hi('NonText', c.base01)
hi('SpecialKey', c.base01)
hi('Whitespace', c.base01)
hi('EndOfBuffer', c.base02)

-- === Popup / Completion ===
hi('PmenuSbar', nil, c.base02)
hi('PmenuThumb', nil, c.base01)

-- === Cursor / selections ===
hi('Cursor', c.base03, c.blue)
hi('TermCursor', c.base03, c.blue)
hi('TermCursorNC', c.base03, c.base01)

-- === Telescope highlights ===
hi('TelescopeNormal', c.base0, c.base03) -- main area
hi('TelescopeBorder', c.base0, c.base03) -- border
-- hi('TelescopePromptNormal', c.base0, c.base02) -- prompt area
-- hi('TelescopePromptBorder', c.blue, c.base02) -- prompt border
hi('TelescopePromptPrefix', c.green, nil) -- prompt symbol (like >)
hi('TelescopeSelection', c.base0, c.base02, 'bold') -- selected item
hi('TelescopeSelectionCaret', c.red, c.base02, 'bold') -- caret
hi('TelescopeMatching', c.orange) -- matched text
hi('TelescopeMultiSelection', c.yellow) -- multi-selection items
hi('TelescopeTitle', c.blue, c.base03, 'bold')
hi('TelescopePreviewTitle', c.cyan, c.base03, 'bold')
hi('TelescopePromptTitle', c.green, nil, 'bold')
hi('TelescopeResultsTitle', c.base0, c.base03, 'bold')

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

-- Treesitter overrides
local treesitter = {
  ['@keyword'] = c.green,
  ['@conditional'] = c.green,
  ['@repeat'] = c.green,
  ['@operator'] = c.green,
  ['@function'] = c.blue,
  ['@function.builtin'] = c.orange,
  ['@type'] = c.yellow,
  ['@variable'] = c.base0,
  ['@constant'] = c.violet,
  ['@string'] = c.cyan,
  ['@comment'] = c.base01,
  ['@number'] = c.violet,
  ['@boolean'] = c.violet,
  ['@field'] = c.base0,
  ['@attribute'] = c.violet,
  ['@namespace'] = c.cyan,
}

for group, color in pairs(treesitter) do
  hi(group, color)
end

vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#30525c' })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = '#30525c' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = '#30525c' })

return M
