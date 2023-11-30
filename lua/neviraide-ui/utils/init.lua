local M = {}

function M.replace_word(old, new)
  local neviraide_conf = vim.fn.stdpath('config') .. '/lua/' .. 'NEVIRAIDE.lua'
  local file = io.open(neviraide_conf, 'r')
  local added_pattern = string.gsub(old, '-', '%%-') -- add % before - if exists
  if file ~= nil then
    local new_content = file:read('*all'):gsub(added_pattern, new)
    --
    file:close()
    --
    file = io.open(neviraide_conf, 'w')
    if file ~= nil then
      file:write(new_content)
      file:close()
    end
  end
end

-- for local working with plugin
---@return table
M.dirLookup = function()
  local default_themes = {}
  local hyprTheme_enabled = require('neviraide-ui').config.hyprTheme

  local path = vim.fn.stdpath('data')
    .. '/lazy/UI/lua/neviraide-ui/themes/colorschemes'

  if hyprTheme_enabled then
    path = vim.fn.stdpath('data') .. '/lazy/UI/lua/neviraide-ui/hyprland/themes'
  end

  if vim.fn.isdirectory(path) then
    default_themes = vim.fn.readdir(path)
    for index, theme in ipairs(default_themes) do
      default_themes[index] = theme:match('(.+)%..+')
    end

    if #default_themes > 0 then return default_themes end
  end

  local themes_dir = os.getenv('HOME')
    .. '/GitHub/nvim_plugins/neviraide-ui.nvim/lua/neviraide-ui/themes/colorschemes'

  if hyprTheme_enabled then
    themes_dir = vim.fn.stdpath('data')
      .. '/lazy/UI/lua/neviraide-ui/hyprland/themes'
  end

  local list = {}
  local p = io.popen(
    'find "'
      .. themes_dir
      .. '" -type f -iname "*.lua" -execdir sh -c \'printf "%s\n" "${0%.*}"\' {} \';\''
  )

  if p ~= nil then
    for file in p:lines() do
      table.insert(list, file)
    end
    p:close()
  end

  return list
end

---@param set string
---@return function
M.settings = function(set)
  return require('neviraide-ui.utils.change_settings.' .. set)
end

---@param str string
---@return string
M.capitalizeFirstLetter = function(str)
  return str:sub(1, 1):upper() .. str:sub(2)
end

return M
