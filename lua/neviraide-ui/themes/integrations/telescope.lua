local color = require('neviraide-ui.themes.colors').palette

return {
  TelescopeSelection = {
    bg = color.one_bg3,
    bold = true,
  },
  TelescopeSelectionCaret = { fg = color.red },
  TelescopeResultsDiffAdd = { fg = color.blue },
  TelescopeResultsDiffChange = { fg = color.yellow },
  TelescopeResultsDiffDelete = { fg = color.red },
  TelescopeNormal = { bg = color.tab_bar_background },
  TelescopePreviewTitle = {
    fg = color.tab_bar_background,
    bg = color.blue,
    bold = true,
  },
  TelescopeBorder = {
    fg = color.tab_bar_background,
    bg = color.tab_bar_background,
  },
  TelescopeResultsNormal = {
    bg = color.tab_bar_background,
    fg = color.grey,
  },
  TelescopeResultsTitle = {
    bg = color.green,
    fg = color.black,
    bold = true,
  },
  TelescopePromptTitle = {
    fg = color.black,
    bg = color.red,
    bold = true,
  },
  TelescopePromptBorder = {
    fg = color.grey,
    bg = color.grey,
  },
  TelescopePromptPrefix = {
    fg = color.red,
    bg = color.grey,
  },
  TelescopePromptNormal = {
    bg = color.grey,
    fg = color.black,
    bold = true,
  },
  TelescopePromptCounter = { bg = color.grey, fg = color.red },
}
