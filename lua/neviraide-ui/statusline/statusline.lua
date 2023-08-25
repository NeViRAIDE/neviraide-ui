local component = require('neviraide-ui.statusline.components')

local M = {}

M.run = function()
  local modules = {
    component.LSP_status() or '',
    component.LSP_Diagnostics(),
    component.lazy(),

    component.indent(),
    component.filesize(),
    component.separator('|', 2),
    component.fileformat(),
    component.separator('|', 2),
    component.location(),
    component.separator('', 2),
    component.mode(),
    component.separator('', 2),
    component.spaces(),
    component.separator('|', 2),
    component.interpreter('Comment'),
    component.separator('|', 2),
    component.encoding(),
    component.indent(),

    component.git(),
  }

  return table.concat(modules)
end

return M
