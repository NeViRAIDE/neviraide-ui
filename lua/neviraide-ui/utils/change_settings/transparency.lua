local M = {}
local g = vim.g

local write = require('neviraide-ui.utils').replace_word

M.toggle = function()
  g.t = not g.t

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().ui.transparency)
  local new_data = 'transparency = ' .. tostring(g.t)
  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')

  require('neviraide-ui.themes').load_all_highlights()
end

M.enable = function()
  g.t = true

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().ui.transparency)
  local new_data = 'transparency = ' .. tostring(g.t)
  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')

  require('neviraide-ui.themes').load_all_highlights()
end

M.disable = function()
  g.t = false

  local old_data = 'transparency = ' .. tostring(NEVIRAIDE().ui.transparency)
  local new_data = 'transparency = ' .. tostring(g.t)
  write(old_data, new_data)
  require('plenary.reload').reload_module('NEVIRAIDE')

  require('neviraide-ui.themes').load_all_highlights()
end

return M
