local M = {}

-- Selenized Dark palette
local c = {
  base00 = '#053d48',
  base01 = '#0e4956',
  base02 = '#275b69',
  base03 = '#718b90',
  base04 = '#adbcbc',
  base05 = '#c8d7d8',
  base06 = '#f0e4cc',
  base07 = '#fef3da',
  red = '#fd564e',
  orange = '#f38649',
  magenta = '#f176bd',
  green = '#80b83c',
  cyan = '#39c7b9',
  blue = '#0096f5',
  yellow = '#e3b230',
  violet = '#a58cec',
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

-- === UI Elements ===
hi('Normal', c.base05, c.base00)
hi('LineNr', c.base03, c.base01)
hi('CursorLineNr', c.base05, c.base01, 'bold')
hi('StatusLine', c.base05, c.base01)
hi('StatusLineNC', c.base04, c.base01)
hi('VertSplit', c.base02, c.base02)
hi('Folded', c.base03, c.base02)
hi('SignColumn', nil, c.base01)
hi('ColorColumn', nil, c.base02)
hi('CursorLine', nil, c.base00)
hi('Visual', nil, c.base02)
hi('Pmenu', c.base05, c.base02)
hi('PmenuSel', c.base00, c.yellow, 'bold')
hi('WildMenu', c.base00, c.yellow, 'bold')
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
hi('Comment', c.base03)
hi('Operator', c.green) -- =, +, -, etc.
hi('Constant', c.violet) -- true, false, nil, numbers
hi('PreProc', c.orange) -- #include, #define, etc.
hi('Special', c.orange) -- built-ins, meta
hi('Number', c.violet)
hi('Boolean', c.violet)
hi('Tag', c.cyan)
hi('Underlined', c.base05, nil, 'underline')

-- === Diagnostics ===
hi('DiagnosticError', c.red)
hi('DiagnosticWarn', c.yellow)
hi('DiagnosticInfo', c.cyan)
hi('DiagnosticHint', c.green)

-- === TODO/INFO/NOTE ===
hi('TodoHighlight', c.yellow, nil, 'bold')
hi('FixHighlight', c.red, nil, 'bold')
hi('NoteHighlight', c.green, nil, 'bold')
hi('InfoHighlight', c.orange, nil, 'bold')
vim.cmd [[
  augroup HighlightCommentsKeywords
    autocmd!
    autocmd BufEnter,BufReadPost * call matchadd("TodoHighlight", "\\v\\s*TODO")
    autocmd BufEnter,BufReadPost * call matchadd("FixHighlight", "\\v\\s*FIX")
    autocmd BufEnter,BufReadPost * call matchadd("NoteHighlight", "\\v\\s*NOTE")
    autocmd BufEnter,BufReadPost * call matchadd("InfoHighlight", "\\v\\s*INFO")
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
hi('Search', c.base00, c.yellow, 'bold')
hi('IncSearch', c.base00, c.orange, 'bold')
hi('CurSearch', c.base00, c.red, 'bold')
hi('MatchParen', c.red, c.base02, 'bold')

-- === Diff / Git ===
hi('DiffAdd', c.green, c.base01)
hi('DiffChange', c.yellow, c.base01)
hi('DiffDelete', c.red, c.base01)
hi('DiffText', c.orange, c.base01, 'bold')
hi('GitSignsAdd', c.green, c.base01)
hi('GitSignsChange', c.yellow, c.base01)
hi('GitSignsDelete', c.red, c.base01)

-- === Tabs & Splits ===
hi('TabLine', c.base05, c.base02)
hi('TabLineSel', c.base00, c.blue, 'bold')
hi('TabLineFill', c.base03, c.base02)
hi('WinSeparator', c.base03, c.base02)

-- === Whitespace / misc ===
hi('NonText', c.base03)
hi('SpecialKey', c.base03)
hi('Whitespace', c.base03)
hi('EndOfBuffer', c.base02)

-- === Popup / Completion ===
hi('PmenuSbar', nil, c.base02)
hi('PmenuThumb', nil, c.base03)

-- === Cursor / selections ===
hi('Cursor', c.base00, c.blue)
hi('TermCursor', c.base00, c.blue)
hi('TermCursorNC', c.base00, c.base03)

-- === Telescope highlights ===
hi('TelescopeNormal', c.base05, c.base00) -- main area
hi('TelescopeBorder', c.base05, c.base00) -- border
hi('TelescopePromptPrefix', c.green, nil) -- prompt symbol (like >)
hi('TelescopeSelection', c.base05, c.base02, 'bold') -- selected item
hi('TelescopeSelectionCaret', c.red, c.base02, 'bold') -- caret
hi('TelescopeMatching', c.orange) -- matched text
hi('TelescopeMultiSelection', c.yellow) -- multi-selection items
hi('TelescopeTitle', c.blue, c.base00, 'bold')
hi('TelescopePreviewTitle', c.cyan, c.base00, 'bold')
hi('TelescopePromptTitle', c.green, nil, 'bold')
hi('TelescopeResultsTitle', c.base05, c.base00, 'bold')

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
  ['@comment'] = c.base1,
  ['@number'] = c.violet,
  ['@boolean'] = c.violet,
  ['@field'] = c.base0,
  ['@attribute'] = c.violet,
  ['@namespace'] = c.cyan,
}

for group, color in pairs(treesitter) do
  hi(group, color)
end

hi('LspReferenceText', nil, c.base01)
hi('LspReferenceRead', nil, c.base01)
hi('LspReferenceWrite', nil, c.base01)

return M
