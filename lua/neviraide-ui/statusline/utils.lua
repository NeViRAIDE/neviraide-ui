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
    'nui_themes',
    'nui_new',
    'nui_input',
    'nui_sm',
    'nofile',
    'neo-tree',
    'terminal',
  }
  for type in pairs(list) do
    if vim.bo.filetype == list[type] then return false end
  end
  return true
end

---If buffer not empty.
---@return boolean
M.buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end

return M
