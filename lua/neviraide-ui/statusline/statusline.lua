local component = require('neviraide-ui.statusline.components')

local M = {}

M.run = function()
  local modules = {
    component.LSP_status() or '',
    component.LSP_Diagnostics(),

    component.indent(),
    component.lazy(),
    component.mode(),
    component.filesize(),
    component.location(),
    component.fileformat(),
    component.encoding(),
    component.spaces(),
    component.interpreter('Comment'),
    component.indent(),

    component.git(),
  }

  return table.concat(modules)
end

return M
