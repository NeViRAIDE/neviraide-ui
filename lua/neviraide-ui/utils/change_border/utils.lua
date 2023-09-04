local M = {}

local list = {
  rounded = '{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" }',
  single = '{ "─", "│", "─", "│", "┌", "┐", "┘", "└" }',
  double = '{ "═", "║", "═", "║", "╔", "╗", "╝", "╚" }',
  solid = '{ " ", " ", " ", " ", " ", " ", " ", " " }',
  none = '{ "", "", "", "", "", "", "", "" }',
}

---@param border 'none'|'single'|'double'|'rounded'|'solid'|'shadow'
M.set_borders = function(border)
  vim.g.border = border

  ---@type string
  local chars

  for key in pairs(list) do
    if border == key then
      chars = list[border]
    else
      chars = list['solid']
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

return M
