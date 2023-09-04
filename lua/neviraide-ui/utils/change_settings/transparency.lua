local M = {}
local g = vim.g

local write = require('neviraide-ui.utils').replace_word

M.toggle = function()
  g.transparency = not g.transparency
  M.load_all_highlights()

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().transparency)
  local new_data = 'transparency = ' .. tostring(g.transparency)

  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

M.enable = function()
  g.transparency = true
  M.load_all_highlights()

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().transparency)
  local new_data = 'transparency = ' .. tostring(g.transparency)

  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

M.disable = function()
  g.transparency = true
  M.load_all_highlights()

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().transparency)
  local new_data = 'transparency = ' .. tostring(g.transparency)

  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M
