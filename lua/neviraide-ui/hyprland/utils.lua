---Define the file path by concatenating the home directory with the relative path.
---@type string file_path The path to the Wall-Dcol.css file.
local file_path = os.getenv('HOME') .. '/.config/waybar/themes/Wall-Dcol.css'

---Variable to store the extracted value of main-fg.
---@string main_fg_value The extracted main-fg color value.
local main_fg_value

--- Function to read the file and extract the values of 'main-fg' and 'wb-act-bg'.
--- Opens the file for reading and reads line by line to find the color definitions.
---@return string|nil main_fg_value The extracted main-fg color value, or nil if not found.
---@return string|nil wb_act_bg_value The extracted wb-act-bg color value, or nil if not found.
local function extract_colors()
  --- Open the file for reading
  -- @type file*
  local file = io.open(file_path, 'r')
  if not file then
    print('Failed to open file: ' .. file_path)
    return nil, nil
  end

  for line in file:lines() do
    --- Try to match the pattern for 'main-fg' color definition
    ---@type string
    local match_main_fg = line:match('@define%-color main%-fg (%S+);')
    if match_main_fg then main_fg_value = match_main_fg end

    --- Try to match the pattern for 'wb-act-bg' color definition
    ---@type string
    local match_wb_act_bg = line:match('@define%-color wb%-act%-bg (%S+);')
    if match_wb_act_bg then wb_act_bg_value = match_wb_act_bg end

    -- Break the loop if both values are found
    if main_fg_value and wb_act_bg_value then break end
  end

  file:close()
  return main_fg_value, wb_act_bg_value
end

local M = {}

M.accent = extract_colors

function M.get_theme_from_hypr()
  local hypr_conf_path = os.getenv('HOME') .. '/.config/hypr/themes/theme.conf'
  local hypr_conf_file = io.open(hypr_conf_path, 'r')

  if hypr_conf_file then
    local hypr_conf_content = hypr_conf_file:read('*all')
    hypr_conf_file:close()

    ---@type string
    local extracted_theme

    for line in hypr_conf_content:gmatch('[^\n]+') do
      if
        line:match(
          '^exec = gsettings set org.gnome.desktop.interface gtk%-theme'
        )
      then
        extracted_theme = line:match("'([^']+)'.*$")
        break
      end
    end

    return extracted_theme
  else
    print('Config file not found')
    return nil
  end
end

return M
