local M = {}

---@return string
function M.read_file(file)
  local fd = io.open(file, 'r')
  if not fd then error(('Could not open file %s for reading'):format(file)) end
  local data = fd:read('*a')
  fd:close()
  return data
end

function M.is_exiting() return vim.v.exiting ~= vim.NIL end

function M.write_file(file, data)
  local fd = io.open(file, 'w+')
  if not fd then error(('Could not open file %s for writing'):format(file)) end
  fd:write(data)
  fd:close()
end

---@generic K
---@generic V
---@param tbl table<K, V>
---@param fn fun(key: K, value: V)
---@param sorter? fun(a:V, b:V): boolean
function M.for_each(tbl, fn, sorter)
  local keys = vim.tbl_keys(tbl)
  table.sort(keys, sorter)
  for _, key in ipairs(keys) do
    fn(key, tbl[key])
  end
end

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

---@return boolean
M.is_kitty_terminal = function() return os.getenv('TERM') == 'xterm-kitty' end

return M
