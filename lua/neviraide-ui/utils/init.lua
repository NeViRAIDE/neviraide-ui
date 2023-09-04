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

-- M.dirLookup = function()
--   local path = '/lazy/UI/lua/neviraide-ui/themes/colorschemes'
--   local default_themes = vim.fn.readdir(vim.fn.stdpath('data') .. path)
--   for index, theme in ipairs(default_themes) do
--     default_themes[index] = theme:match('(.+)%..+')
--   end
--   return default_themes
-- end

-- for local working with plugin
---@return table
M.dirLookup = function()
  local themes_dir =
    '$HOME/GitHub/nvim_plugins/neviraide-ui.nvim/lua/neviraide-ui/themes/colorschemes'
  local list = {}
  local p = io.popen(
    'find "'
      .. themes_dir
      .. [[" -type f -iname "*.lua" -execdir sh -c 'printf "%s\n" "${0%.*}"' {} ';']]
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

return M
