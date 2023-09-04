local M = {}
local write = require('neviraide-ui.utils').replace_word
  -- FIX: same names with relativenumber

function M.toggle()
  vim.o.number = not vim.o.number
  local old = 'numbers = ' .. tostring(NEVIRAIDE().numbers)
  local new = 'numbers = ' .. tostring(vim.o.number)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.enable()
  vim.o.number = true
  local old = 'numbers = ' .. tostring(NEVIRAIDE().numbers)
  local new = 'numbers = ' .. tostring(vim.o.number)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.disable()
  vim.o.number = false
  local old = 'numbers = ' .. tostring(NEVIRAIDE().numbers)
  local new = 'numbers = ' .. tostring(vim.o.number)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M
