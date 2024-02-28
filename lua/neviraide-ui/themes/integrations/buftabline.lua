local colors = require('neviraide-ui.themes').get_theme_tb('base_30')
local kitty = require('neviraide-ui.hyprland.utils').colors.kitty

local highlights = {
  BufTabLineFill = { bg = kitty.tab_bar_background },
  BufTabDate = { fg = colors.grey_fg, bg = kitty.tab_bar_background, italic = true },
  TbLineBufOn = { fg = colors.white, bg = kitty.active_tab_background, bold = true },
  TbSeparator = { fg = kitty.active_tab_background, bg = kitty.tab_bar_background, bold = true },
  TbLineBufOff = { fg = colors.light_grey, bg = kitty.tab_bar_background },
  TbLineBufOnModified = { fg = colors.green, bg = kitty.active_tab_background, italic = true },
  TbLineBufOffModified = {
    fg = colors.red,
    bg = kitty.tab_bar_background,
    italic = true,
  },
  TbLineBufOnClose = { fg = colors.red, bg = kitty.active_tab_background },
  TbLineBufOffClose = { fg = colors.light_grey, bg = kitty.tab_bar_background },
  TblineTabNewBtn = { fg = colors.white, bg = colors.black3, bold = true },
  TbLineTabOn = { fg = kitty.background, bg = colors.nord_blue, bold = true },
  TbLineTabOff = { fg = colors.white, bg = colors.black2 },
  TbLineTabCloseBtn = { fg = kitty.background, bg = colors.nord_blue },
  TBTabTitle = { fg = kitty.background, bg = colors.white },
  TbLineThemeToggleBtn = { bold = true, fg = colors.white, bg = colors.black3 },
  TbLineCloseAllBufsBtn = {
    bold = true,
    bg = colors.red,
    fg = kitty.background,
  },
}

local hlgroups_glassy = {
  'BufTabDate',
  'BufTabLineFill',
  'TbLineBufOn',
  'TbLineBufOff',
  'TbLineBufOnClose',
  'TbLineBufOffClose',
  'TbLineBufOnModified',
  'TbLineBufOffModified',
}

if vim.g.transparency then
  for _, val in ipairs(hlgroups_glassy) do
    highlights[val].bg = 'NONE'
  end
end

return highlights
