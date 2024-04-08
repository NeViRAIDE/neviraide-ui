local component = require('neviraide-ui.statusline.components')
local util = require('neviraide-ui.statusline.utils')

-- TODO: add validation for all module (to check errors)
local function validate_module(module)
  local ok, result = pcall(module)
  if ok and type(result) == 'string' then
    return result
  else
    return ''
  end
end

local M = {}

require('neviraide-ui.statusline.onclick')

M.run = function()
  local modules = {
    component.LSP_status() or '',
    validate_module(component.LSP_Diagnostics),
    validate_module(component.todos),
    component.lazy(),

    component.indent(),

    component.location(),
    component.fileformat(not util.ignored() and util.hide_in_width(120)),
    component.filesize(not util.ignored() and util.hide_in_width()),

    component.mode(),

    component.spaces(not util.ignored() and util.hide_in_width()),
    component.interpreter(not util.ignored() and util.hide_in_width()),
    component.encoding(not util.ignored() and util.hide_in_width(120)),

    component.indent(),

    component.git(),
  }

  return table.concat(modules)
end

return M
