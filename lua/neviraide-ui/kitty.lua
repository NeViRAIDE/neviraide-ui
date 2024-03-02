local M = {}
---Define the file path by concatenating the home directory with the relative path.
---@type string file_path The path to the themes.css file.
local kitty_path = os.getenv('HOME') .. '/.config/kitty/themes/theme.conf'

M.colors = {
  kitty = {},
}

---Function to read the kitty conf file and extract the values .
---Opens the file for reading and reads line by line to find the color definitions.
local function extract_kitty_colors()
  local theme_file = io.open(kitty_path, 'r')
  if not theme_file then print('Failed to open file: ' .. kitty_path) end

  if theme_file then
    for line in theme_file:lines() do
      local color_name, color_value = line:match('^([%w%-_]+)%s+#([%da-fA-F]+)')
      if color_name and color_value then
        -- Rename colors if needed
        if color_name == 'color0' then color_name = 'black' end
        if color_name == 'color1' then color_name = 'red' end
        if color_name == 'color2' then color_name = 'blue' end
        if color_name == 'color3' then color_name = 'yellow' end
        if color_name == 'color4' then color_name = 'green' end
        if color_name == 'color5' then color_name = 'magenta' end
        if color_name == 'color6' then color_name = 'cyan' end
        if color_name == 'color7' then color_name = 'white' end
        if color_name == 'color8' then color_name = 'bright_black' end
        if color_name == 'color9' then color_name = 'bright_red' end
        if color_name == 'color10' then color_name = 'bright_blue' end
        if color_name == 'color11' then color_name = 'bright_yellow' end
        if color_name == 'color12' then color_name = 'bright_green' end
        if color_name == 'color13' then color_name = 'bright_magenta' end
        if color_name == 'color14' then color_name = 'bright_cyan' end
        if color_name == 'color15' then color_name = 'bright_white' end
        -- Add color to table M.colors
        M.colors.kitty[color_name] = '#' .. color_value
      end
    end
  end

  if theme_file then theme_file:close() end
end

extract_kitty_colors()

return M
