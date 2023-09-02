local component = require('neviraide-ui.statusline.components')
local util = require('neviraide-ui.statusline.utils')

local M = {}

M.run = function()
  local modules = {
    component.LSP_status() or '',
    component.LSP_Diagnostics(),
    component.lazy(),

    component.indent(),
    component.location(),
    component.separator('|', 2, util.ignored() and util.hide_in_width()),
    component.fileformat(util.ignored() and util.hide_in_width(120)),
    component.separator('|', 2, util.ignored() and util.hide_in_width(120)),
    component.filesize(util.ignored() and util.hide_in_width()),
    component.separator('', 2, true),
    component.mode(),
    component.separator('', 2, true),
    component.spaces(util.ignored() and util.hide_in_width()),
    component.separator('|', 2, util.ignored() and util.hide_in_width()),
    component.interpreter(util.hide_in_width()),
    component.separator('|', 2, util.ignored() and util.hide_in_width(120)),
    component.encoding(util.ignored() and util.hide_in_width(120)),
    component.indent(),

    component.git(),
  }

  return table.concat(modules)
end

return M
