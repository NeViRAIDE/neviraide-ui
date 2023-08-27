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
    component.separator('|', 2, util.ignored()),
    component.fileformat(util.ignored()),
    component.separator('|', 2, util.buffer_not_empty()),
    component.filesize(),
    component.separator('', 2,true),
    component.mode(),
    component.separator('', 2, true),
    component.spaces(util.ignored()),
    component.separator('|', 2, util.ignored()),
    component.interpreter('Comment'),
    component.separator('|', 2, util.ignored()),
    component.encoding(util.ignored()),
    component.indent(),

    component.git(),
  }

  return table.concat(modules)
end

return M
