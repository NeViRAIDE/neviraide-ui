local color = require('neviraide-ui.themes.colors').palette

local highlights = {
  CmpItemAbbr = { fg = color.white },
  CmpItemAbbrMatch = { fg = color.green, bold = true },
  -- CmpDoc = { bg = accent.foreground },
  -- CmpDocBorder = { link = "ThemeAccent" },
  CmpPmenu = { link = 'Pmenu' },
  CmpSel = { link = 'PmenuSel' },
}

local item_kinds = {
  -- cmp item kinds
  CmpItemKindConstant = { fg = color.yellow },
  CmpItemKindFunction = { fg = color.green },
  CmpItemKindIdentifier = { fg = color.bright_red },
  CmpItemKindField = { fg = color.bright_red },
  CmpItemKindVariable = { fg = color.magenta },
  CmpItemKindSnippet = { fg = color.red },
  CmpItemKindText = { fg = color.blue },
  CmpItemKindStructure = { fg = color.magenta },
  CmpItemKindType = { fg = color.bright_yellow },
  CmpItemKindKeyword = { fg = color.white },
  CmpItemKindMethod = { fg = color.green },
  CmpItemKindConstructor = { fg = color.green },
  CmpItemKindFolder = { fg = color.white },
  CmpItemKindModule = { fg = color.bright_yellow },
  CmpItemKindProperty = { fg = color.bright_red },
  CmpItemKindEnum = { fg = color.green },
  CmpItemKindUnit = { fg = color.magenta },
  CmpItemKindClass = { fg = color.teal },
  CmpItemKindFile = { fg = color.white },
  CmpItemKindInterface = { fg = color.blue },
  CmpItemKindColor = { fg = color.white },
  CmpItemKindReference = { fg = color.white },
  CmpItemKindEnumMember = { fg = color.purple },
  CmpItemKindStruct = { fg = color.magenta },
  CmpItemKindValue = { fg = color.cyan },
  CmpItemKindEvent = { fg = color.yellow },
  CmpItemKindOperator = { fg = color.white },
  CmpItemKindTypeParameter = { fg = color.bright_red },
  CmpItemKindCopilot = { fg = color.blue },
}

highlights = vim.tbl_deep_extend(
  'force',
  highlights,
  { CmpBorder = { link = 'ThemeAccent' } } or {}
)
highlights = vim.tbl_deep_extend('force', highlights, item_kinds)

if vim.g.b == 'rounded' or vim.g.b == 'single' or vim.g.b == 'double' then
  highlights.CmpPmenu = { bg = 'none' }
end

return highlights
