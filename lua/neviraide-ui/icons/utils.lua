local M = {}

---@param spaces integer
---@return string
local space = function(spaces) return string.rep(' ', spaces) end

---@param icon_code integer
---@return string
M.icon_decoder = function(icon_code) return vim.fn.nr2char(tostring(icon_code)) end

---@param handle_icon string
---@param nonicon_name string
---@param space_before? integer
---@param space_after? integer
M.icon = function(handle_icon, nonicon_name, space_before, space_after)
  local nonicon = require('neviraide-ui.icons.nonicons')

  if space_before == nil or space_after == nil then
    space_before = 0
    space_after = 0
  end

  if vim.g.nonicons then
    return space(space_before)
      .. nonicon[nonicon_name].icon
      .. space(space_after)
  end
  return space(space_before) .. handle_icon .. space(space_after)
end

M.palette = {
  orange = '#d18616',
  black = '#586069',
  bright_black = '#959da5',
  white = '#d1d5da',
  bright_white = '#fafbfc',
  red = '#ea4a5a',
  bright_red = '#f97583',
  green = '#34d058',
  bright_green = '#85e89d',
  yellow = '#ffea7f',
  bright_yellow = '#ffea7f',
  blue = '#2188ff',
  bright_blue = '#79b8ff',
  magenta = '#b392f0',
  bright_magenta = '#b392f0',
  cyan = '#39c5cf',
  bright_cyan = '#56d4dd',
}

return M
