local M = {}

local path = require('neviraide-ui').config.kitty.theme_path

M.colors = {
  kitty = {},
}

M.buftab_style = 'fade'

---Function to read the kitty conf file and extract the values .
---Opens the file for reading and reads line by line to find the color definitions.
local function extract_kitty_colors()
  local theme_file = io.open(path, 'r')
  if not theme_file then print('Failed to open file: ' .. path) end

  if theme_file then
    for line in theme_file:lines() do
      local color_name, color_value = line:match('^([%w%-_]+)%s+#([%da-fA-F]+)')
      if color_name and color_value then
        if color_name == 'active_tab_background' then
          color_name = 'tab_background'
        end
        M.colors.kitty[color_name] = '#' .. color_value
      end
    end
  end

  if theme_file then theme_file:close() end
end

extract_kitty_colors()

local function extract_tab_bar_style()
  local theme_file = io.open(path, 'r')
  if not theme_file then print('Failed to open file: ' .. path) end

  if theme_file then
    for line in theme_file:lines() do
      local tab_bar_style = line:match('^tab_bar_style%s+([^%s]+)')
      if tab_bar_style then M.buftab_style = tab_bar_style end
    end
  end

  if theme_file then theme_file:close() end
end

extract_tab_bar_style()

return M
