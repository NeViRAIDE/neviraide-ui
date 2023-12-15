---Function for creating string of spaces.
---@param spaces? integer number of spaces
---@return string
local function space(spaces) return string.rep(' ', spaces or 0) end

local M = {}

---Function for decoding code of icon to the symbol.
---@param icon_code integer icon code
---@return string
function M.icon_decoder(icon_code) return vim.fn.nr2char(tostring(icon_code)) end

---Funtion for creating string with icon and spases before/after it.
---@param handle_icon string icon symbol, if there is no in nonicons
---@param nonicon_name string icon name in nonicons
---@param space_before? integer number of spases before icon
---@param space_after? integer number of spases after icon
---@return string
function M.icon(handle_icon, nonicon_name, space_before, space_after)
  ---@type table
  local nonicons = require('neviraide-ui.icons.nonicons')

  local icon = vim.g.nonicons
      and nonicons[nonicon_name]
      and nonicons[nonicon_name].icon
    or handle_icon

  return space(space_before) .. icon .. space(space_after)
end

return M
