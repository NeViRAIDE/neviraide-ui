local M = {}
local write = require('neviraide-ui.utils').replace_word

---@param size integer
function M.set_indents(size)
  vim.o.shiftwidth = size
  vim.o.tabstop = size
  vim.o.softtabstop = size

  local old = 'indents = ' .. NEVIRAIDE().indents
  local new = 'indents = ' .. size

  write(old, new)

  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M
