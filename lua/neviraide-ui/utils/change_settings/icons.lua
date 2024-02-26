local M = {}

---@param icons string
M.set_icons = function(icons)
  if icons == 'nonicons' then
    vim.g.n = true
  else
    vim.g.n = false
  end

  local old = 'nonicons = ' .. tostring(NEVIRAIDE().ui.nonicons)
  local new = 'nonicons = ' .. tostring(vim.g.n)
  require('neviraide-ui.utils').replace_word(old, new)

  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M
