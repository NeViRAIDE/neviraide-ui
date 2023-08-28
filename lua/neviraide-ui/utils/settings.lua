local M = {}

local write = require('neviraide-ui.utils').replace_word

function M.toggle_relative_numbers()
  vim.o.relativenumber = not vim.o.relativenumber
  local old = 'relative_numbers = ' .. tostring(NEVIRAIDE().relative_numbers)
  local new = 'relative_numbers = ' .. tostring(vim.o.relativenumber)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_numbers()
  vim.o.number = not vim.o.number
  local old = 'numbers = ' .. tostring(NEVIRAIDE().numbers)
  local new = 'numbers = ' .. tostring(vim.o.numbers)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_cursor_line()
  vim.o.cursorline = not vim.o.cursorline
  local old = 'cursor_line = ' .. tostring(NEVIRAIDE().cursor_line)
  local new = 'cursor_line = ' .. tostring(vim.o.cursorline)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

function M.toggle_cursor_column()
  vim.o.cursorcolumn = not vim.o.cursorcolumn
  local old = 'cursor_column = ' .. tostring(NEVIRAIDE().cursor_column)
  local new = 'cursor_column = ' .. tostring(vim.o.cursorcolumn)
  write(old, new)
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M
