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

M.dirLookup = function()
  -- local default_themes = vim.fn.readdir(
  --   '$HOME/Study/nvim_plugins/neviraide-ui.nvim/lua/neviraide-ui/themes/colorschemes'
  -- )
  -- vim.fn.readdir(vim.fn.stdpath('data') .. '/lazy/base46/lua/base46/themes')
  -- for index, theme in ipairs(default_themes) do
  --   default_themes[index] = theme:match('(.+)%..+')
  -- end

  local fn = vim.fn
  -- return default_themes
  local default_themes = vim.fn.readdir(
    vim.fn.stdpath('data') .. '/lazy/UI/lua/neviraide-ui/themes/colorschemes'
  )

  local custom_themes = vim.loop.fs_stat(
    '$HOME/Study/nvim_plugins/neviraide-ui.nvim/lua/neviraide-ui/themes/colorschemes'
  )

  if custom_themes and custom_themes.type == 'directory' then
    local themes_tb = fn.readdir(fn.stdpath('config') .. '/lua/custom/themes')
    for _, value in ipairs(themes_tb) do
      default_themes[#default_themes + 1] = value
    end
  end

  for index, theme in ipairs(default_themes) do
    default_themes[index] = theme:match('(.+)%..+')
  end

  return default_themes
end

M.dirLookup1 = function()
  local themes_dir =
    '$HOME/Study/nvim_plugins/neviraide-ui.nvim/lua/neviraide-ui/themes/colorschemes'
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

return M
