local component = require('neviraide-ui.buftabline.modules.components')
-- dofile(vim.g.base46_cache .. 'tbline')
require('neviraide-ui.buftabline.modules.onclick')

return function()
  local modules = {
    component.NeoTreeOverlay(),
    component.bufferlist(),
    component.tablist(),
    component.buttons(),
  }
  return table.concat(modules)
end
