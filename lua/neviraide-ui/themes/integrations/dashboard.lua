local color = require('neviraide-ui.themes.colors').palette

return {
  NeviraideDashboardAscii = {
    bg = 'none',
    fg = color.green,
  },

  NeviraideDashboardButtons = {
    fg = color.grey_fg,
    bg = 'none',
  },

  NeviraideDashboardVimver = {
    fg = color.one_bg2,
    bg = 'none',
    italic = true,
    bold = false,
  },

  DashboardCursorLine = {
    bold = true,
    fg = color.orange,
    bg = 'none',
  },
}
