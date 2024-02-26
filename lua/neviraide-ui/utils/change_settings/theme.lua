local M = {}

local function reload_theme(name)
  vim.g.nt = name
  require('neviraide-ui.themes').load_all_highlights()
  vim.api.nvim_exec_autocmds('User', { pattern = 'NeviraideThemeReload' })
end

---@param theme string
M.change_theme = function(theme)
  reload_theme(theme)
  require('neviraide-ui.utils').replace_word(
    "theme = '" .. NEVIRAIDE().ui.theme .. "'",
    "theme = '" .. theme .. "'"
  )
  require('plenary.reload').reload_module('NEVIRAIDE')
end

return M
