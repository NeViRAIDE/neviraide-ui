local M = {}

M.ignored = function()
  local list = {
    'help',
    'TelescopePrompt',
    'neviraideDashboard',
    'lazy',
    'mason',
    'lspinfo',
    'noice',
    'nui',
    'colorschemes',
    'create',
    'nui_input',
    'nui_sm',
    'nofile',
    'neo-tree',
    'terminal',
    'notify',
  }
  for type in pairs(list) do
    if vim.bo.filetype == list[type] then return false end
  end
  return true
end

---If buffer not empty.
---@return boolean
M.buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end

---Window width less than <size> columns
---@param size? integer
---@return boolean
M.hide_in_width = function(size)
  if size == nil then size = 90 end
  return vim.o.columns > size
end
-- M.hide_in_width = function() return vim.fn.winwidth(0) > 100 end

return M
