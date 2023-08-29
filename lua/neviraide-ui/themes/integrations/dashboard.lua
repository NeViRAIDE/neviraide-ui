local colors = require('neviraide-ui.themes').get_theme_tb('base_30')

return {
  NeviraideDashboardAscii = {
    bg = 'none',
    fg = colors.green,
  },

  NeviraideDashboardButtons = {
    fg = colors.orange,
    bg = 'none',
    bold = true,
  },

  NeviraideDashboardVimver = {
    fg = colors.grey,
    bg = 'none',
    italic = true,
    bold = false,
  },
}
