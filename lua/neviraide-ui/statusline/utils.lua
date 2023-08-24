local M = {}

---@return boolean
M.ignored_filetypes = function()
  -- TODO: hide statusline for filetypes
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
  }
  local filetype = vim.bo.filetype
  for _, value in pairs(list) do
    if filetype == list[value] then return true end
    return false
  end
end

return M
