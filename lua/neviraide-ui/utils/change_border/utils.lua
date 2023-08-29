-- TODO: reload config on change
local M = {}

local list = {
  -- TODO: add double
  bordered = {
    rounded = '{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" }',
    single = '{ "─", "│", "─", "│", "┌", "┐", "┘", "└" }',
  },
  none = '{ " ", " ", " ", " ", " ", " ", " ", " " }',
}

---@param border 'none'|'single'|'double'|'rounded'|'solid'|'shadow'
M.set_borders = function(border)
  vim.g.border = border

  ---@type string
  local chars

  for key in pairs(list.bordered) do
    if border == key then
      chars = list.bordered[border]
      break
    else
      chars = list.none
    end
  end

  local old_data_chars = "borderchars = '"
    .. tostring(NEVIRAIDE().borderchars)
    .. "'"
  local new_data_chars = "borderchars = '" .. tostring(chars) .. "'"

  local old_borders = "border = '" .. tostring(NEVIRAIDE().border) .. "'"
  local new_borders = "border = '" .. tostring(border) .. "'"

  require('neviraide-ui.utils').replace_word(old_borders, new_borders)
  require('neviraide-ui.utils').replace_word(old_data_chars, new_data_chars)
  require('plenary.reload').reload_module('NEVIRAIDE')
end
-- M.set_borders('rounded')

return M
