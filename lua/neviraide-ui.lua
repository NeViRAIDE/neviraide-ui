local hyprTheme = require('neviraide-ui.hyprdots').get_theme_from_hypr()

local M = {}

---Default NeviraideUI configuration
M.config = {
  hyprdots = false,
  notify = false,
}

---Setup configuration
function M.setup(config)
  M.config = vim.tbl_deep_extend('force', M.config, config or {})

  vim.opt.statusline = '%!v:lua.require("neviraide-ui.statusline").run()'
  require('neviraide-ui.commands').setup()

  if M.config.notify then require('neviraide-ui.notifications').setup() end

  if M.config.hyprdots then
    require('neviraide-ui.utils.change_settings.theme').change_theme(hyprTheme)
  end
end

function M.cmd(name) require('neviraide-ui.commands').cmd(name) end

return M
