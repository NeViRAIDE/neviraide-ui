local Popup = require('nui.popup')
local utils = require('neviraide-ui.override_vim_ui.utils')

return {
  main = Popup({
    border = utils.nui_border({
      top = ' Settings ',
    }),
    position = '50%',
    size = '50%',
    -- size = {
    --   width = popup_conf.main_width,
    --   height = popup_conf.main_height,
    -- },
    relative = 'editor',
    buf_options = {
      modifiable = false,
      readonly = true,
      filetype = 'settings',
    },
  }),
  tree = Popup({
    enter = true,
    border = 'rounded',
  }),
  desc = Popup({
    border = 'rounded',
  }),
}
