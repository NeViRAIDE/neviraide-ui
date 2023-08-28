local themes = {
  'everforest',
  'everforest_light',
  'nordic',
  'onedark',
  'tokyonight',
}

return function()
  local Popup = require('nui.popup')
  ---@type integer number of themes installed
  local theme_count = #themes

  local utils = require('neviraide-ui.override_vim_ui.utils')

  local border = require('neviraide-ui.utils.nui_float_border')

  local text = {
    top = ' Colorschemes ',
    top_align = 'right',
    bottom = ' ' .. NEVIRAIDE().theme:gsub('^%l', string.upper) .. ' ',
  }

  return Popup({
    position = { row = 3, col = '97%' },
    size = { width = 20, height = theme_count },
    enter = true,
    focusable = true,
    zindex = 999,
    relative = 'editor',
    border = border(text).border,
    win_options = utils.popup_bg(border),
    buf_options = {
      modifiable = false,
      readonly = true,
      filetype = 'nui_themes',
    },
  })
end
