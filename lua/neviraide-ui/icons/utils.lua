local M = {}

---@param icon_code integer
---@return string
M.icon_decoder = function(icon_code) return vim.fn.nr2char(tostring(icon_code)) end

---Nonicons is required
---@param name string
---@param space_before? boolean
---@param space_after? boolean
---@return string
M.nonicon = function(name, space_before, space_after)
  local nonicon = require('neviraide-ui.icons.nonicons.mappings')
  if space_before then
    return ' ' .. vim.fn.nr2char(nonicon[name])
  elseif space_after then
    return vim.fn.nr2char(nonicon[name]) .. ' '
  elseif space_after and space_before then
    return ' ' .. vim.fn.nr2char(nonicon[name]) .. ' '
  else
    return vim.fn.nr2char(nonicon[name])
  end
end

---@param name string
---@param space_before? boolean
---@param space_after? boolean
---@return string
M.devicon = function(name, space_before, space_after)
  local devicon = require('neviraide-ui.icons.devicons')
  if space_before then
    return ' ' .. devicon[name]['icon']
  elseif space_after then
    return devicon[name]['icon'] .. ' '
  elseif space_after and space_before then
    return ' ' .. devicon[name]['icon'] .. ' '
  else
    return devicon[name]['icon']
  end
end

---@param name string
---@param space_before? boolean
---@param space_after? boolean
M.icon = function(name, space_before, space_after)
  if vim.g.nonicons then return M.nonicon(name, space_before, space_after) end
  -- return M.devicon(name, space_before, space_after)
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
