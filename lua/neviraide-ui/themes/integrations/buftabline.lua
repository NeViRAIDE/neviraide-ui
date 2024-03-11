local color = require('neviraide-ui.themes.colors').palette

local highlights = {
  PomoTimer = { bg = 'red', fg = 'black' },
  BufTabLineFill = { bg = color.tab_bar_background },
  BufTabDate = {
    fg = color.grey_fg,
    bg = color.tab_bar_background,
    italic = true,
  },
  TbLineBufOn = {
    fg = color.white,
    bg = color.active_tab_background,
    bold = true,
  },
  TbSeparator = {
    fg = color.active_tab_background,
    bg = color.tab_bar_background,
    bold = true,
  },
  TbLineBufOff = { fg = color.light_grey, bg = color.tab_bar_background },
  TbLineBufOnModified = {
    fg = color.green,
    bg = color.active_tab_background,
    italic = true,
  },
  TbLineBufOffModified = {
    fg = color.red,
    bg = color.tab_bar_background,
    italic = true,
  },
  TbLineBufOnClose = { fg = color.red, bg = color.active_tab_background },
  TbLineBufOffClose = { fg = color.light_grey, bg = color.tab_bar_background },
  TblineTabNewBtn = { fg = color.white, bg = color.black3, bold = true },
  TbLineTabOn = { fg = color.background, bg = color.nord_blue, bold = true },
  TbLineTabOff = { fg = color.white, bg = color.black2 },
  TbLineTabCloseBtn = { fg = color.background, bg = color.nord_blue },
  TBTabTitle = { fg = color.background, bg = color.white },
  TbLineThemeToggleBtn = { bold = true, fg = color.white, bg = color.black3 },
  TbLineCloseAllBufsBtn = {
    bold = true,
    bg = color.red,
    fg = color.background,
  },
}

-- local hlgroups_glassy = {
--   'BufTabDate',
--   'BufTabLineFill',
--   'TbLineBufOn',
--   'TbLineBufOff',
--   'TbLineBufOnClose',
--   'TbLineBufOffClose',
--   'TbLineBufOnModified',
--   'TbLineBufOffModified',
-- }

-- if vim.g.transparency then
--   for _, val in ipairs(hlgroups_glassy) do
--     highlights[val].bg = 'NONE'
--   end
-- end

return highlights
