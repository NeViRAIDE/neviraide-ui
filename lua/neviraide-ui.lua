local M = {}

M.config = {
  hyprdots = false,
}

local hyprTheme = require('neviraide-ui.hyprland.utils').get_theme_from_hypr()

---Setup configuration
function M.setup(config)
  M.config = vim.tbl_deep_extend('force', M.config, config or {})
  vim.opt.statusline = '%!v:lua.require("neviraide-ui.statusline").run()'
  require('neviraide-ui.commands').setup()

  require('neviraide-ui.utils.change_settings.theme').change_theme(hyprTheme)
end

function M.cmd(name) require('neviraide-ui.commands').cmd(name) end

return M
