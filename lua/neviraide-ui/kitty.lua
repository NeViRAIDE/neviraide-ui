local M = {}

local theme_path = require('neviraide-ui').config.kitty.theme_path

M.colors = {
  kitty = {},
}

M.buftab_style = 'fade'

M.check_nonicons = function(conf_path)
  local conf_file = io.open(conf_path, 'r')
  if not conf_file then
    print('Failed to open file: ' .. theme_path)
    return
  end

  local symbol_map_present = false
  for line in conf_file:lines() do
    if line:find('^symbol_map U%+f101%-U%+f25c nonicons') then
      symbol_map_present = true
      break
    end
  end
  conf_file:close()

  if not symbol_map_present then
    conf_file = io.open(conf_path, 'a')
    if conf_file then
      conf_file:write('symbol_map U+f101-U+f25c nonicons\n')
      conf_file:close()
      if vim.fn.systemlist('pidof kitty')[1] ~= '' then
        vim.cmd('silent !kill -USR1 $(pidof kitty)')
      end
    else
      print('Can not open file for writing: ' .. conf_path)
    end
  end
end

---Function to read the kitty conf file and extract the values .
---Opens the file for reading and reads line by line to find the color definitions.
local function extract_kitty_colors()
  local theme_file = io.open(theme_path, 'r')
  if not theme_file then print('Failed to open file: ' .. theme_path) end

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
  local theme_file = io.open(theme_path, 'r')
  if not theme_file then print('Failed to open file: ' .. theme_path) end

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
