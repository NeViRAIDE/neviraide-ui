local M = {}

M.change_icons = function()
  ---@type boolean
  local icons = vim.g.n

  local old = 'nonicons = ' .. tostring(NEVIRAIDE().ui.nonicons)
  local new = 'nonicons = ' .. tostring(not icons)
  require('neviraide-ui.utils').replace_word(old, new)

  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M
