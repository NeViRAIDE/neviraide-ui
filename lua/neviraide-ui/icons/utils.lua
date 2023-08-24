local icons = require('neviraide-ui.icons.mappings')

---Nonicons is required
---@param name string
---@return string
local function icon(name) return vim.fn.nr2char(icons[name]) end

local palette = {
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

return { icon = icon, palette = palette }
