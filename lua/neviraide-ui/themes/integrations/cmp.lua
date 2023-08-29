local base16 = require('neviraide-ui.themes').get_theme_tb('base_16')
local colors = require('neviraide-ui.themes').get_theme_tb('base_30')

local highlights = {
  CmpItemAbbr = { fg = colors.white },
  CmpItemAbbrMatch = { fg = colors.blue, bold = true },
  CmpDoc = { bg = colors.darker_black },
  CmpDocBorder = { fg = colors.darker_black, bg = colors.darker_black },
  CmpPmenu = { bg = colors.black },
  CmpSel = { link = 'PmenuSel', bold = true },
}

local item_kinds = {
  -- cmp item kinds
  CmpItemKindConstant = { fg = base16.base09 },
  CmpItemKindFunction = { fg = base16.base0D },
  CmpItemKindIdentifier = { fg = base16.base08 },
  CmpItemKindField = { fg = base16.base08 },
  CmpItemKindVariable = { fg = base16.base0E },
  CmpItemKindSnippet = { fg = colors.red },
  CmpItemKindText = { fg = base16.base0B },
  CmpItemKindStructure = { fg = base16.base0E },
  CmpItemKindType = { fg = base16.base0A },
  CmpItemKindKeyword = { fg = base16.base07 },
  CmpItemKindMethod = { fg = base16.base0D },
  CmpItemKindConstructor = { fg = colors.blue },
  CmpItemKindFolder = { fg = base16.base07 },
  CmpItemKindModule = { fg = base16.base0A },
  CmpItemKindProperty = { fg = base16.base08 },
  CmpItemKindEnum = { fg = colors.blue },
  CmpItemKindUnit = { fg = base16.base0E },
  CmpItemKindClass = { fg = colors.teal },
  CmpItemKindFile = { fg = base16.base07 },
  CmpItemKindInterface = { fg = colors.green },
  CmpItemKindColor = { fg = colors.white },
  CmpItemKindReference = { fg = base16.base05 },
  CmpItemKindEnumMember = { fg = colors.purple },
  CmpItemKindStruct = { fg = base16.base0E },
  CmpItemKindValue = { fg = colors.cyan },
  CmpItemKindEvent = { fg = colors.yellow },
  CmpItemKindOperator = { fg = base16.base05 },
  CmpItemKindTypeParameter = { fg = base16.base08 },
  CmpItemKindCopilot = { fg = colors.green },
}

highlights = vim.tbl_deep_extend(
  'force',
  highlights,
  { CmpBorder = { fg = colors['gray_fg'] } } or {}
)
highlights = vim.tbl_deep_extend('force', highlights, item_kinds)

-- highlights.CmpSel = {
--   fg = colors.white,
--   bg = (
--     highlights.CmpPmenu.bg == colors.black2 and colors.grey or colors.one_bg3
--   ),
--   bold = true,
-- }

return highlights
