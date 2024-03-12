local color = require('neviraide-ui.themes.colors').palette

local highlights = {
  PomoTimer = {
    bg = color.inactive_accent,
    fg = color.second_background,
    bold = true,
  },

  BufTabLineFill = { bg = color.second_background },
  BufTabDate = {
    fg = color.inactive_accent,
    bg = color.second_background,
    italic = true,
  },

  TbLineBufOn = {
    fg = color.white,
    bg = color.background,
    bold = true,
  },
  TbSeparator = {
    fg = color.background,
    bg = color.second_background,
    bold = true,
  },
  TbLineBufOff = { fg = color.grey, bg = color.second_background },
  TbLineBufOnModified = {
    fg = color.green,
    bg = color.background,
    italic = true,
  },
  TbLineBufOffModified = {
    fg = color.red,
    bg = color.second_background,
    italic = true,
  },
  TbLineBufOnClose = { fg = color.red, bg = color.background },
  TbLineBufOffClose = { fg = color.grey, bg = color.second_background },
  TblineTabNewBtn = { fg = color.white, bg = color.black, bold = true },
  TbLineTabOn = { fg = color.background, bg = color.nord_blue, bold = true },
  TbLineTabOff = { fg = color.white, bg = color.black },
  TbLineTabCloseBtn = { fg = color.background, bg = color.nord_blue },
  TBTabTitle = { fg = color.background, bg = color.white },
  TbLineThemeToggleBtn = { bold = true, fg = color.white, bg = color.black },
  CloseAllBufsBtn = {
    bold = true,
    bg = color.red,
    fg = color.background,
  },
}

return highlights
