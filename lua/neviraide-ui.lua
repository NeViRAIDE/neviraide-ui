local hyprTheme = require('neviraide-ui.hyprdots').get_theme_from_hypr()

local M = {}

---Default NeviraideUI configuration
M.config = {
  kitty = {
    enable = false,
    theme_path = os.getenv('HOME') .. '/.config/kitty/theme.conf',
    conf_path = os.getenv('HOME') .. '/.config/kitty/kitty.conf',
  },
  ui = {
    hyde = false,
    notify = false,
    buftab = {
      style = 'slant',
    },
  },
}

---Setup configuration
function M.setup(config)
  M.config = vim.tbl_deep_extend('force', M.config, config or {})

  vim.opt.statusline = '%!v:lua.require("neviraide-ui.statusline").run()'
  require('neviraide-ui.commands').setup()

  -- TODO: make following NEVIRAIDE config file
  require('neviraide-ui.diagnostic').setup()

  if M.config.ui.notify then require('neviraide-ui.notifications').setup() end

  if M.config.kitty.enable then
    M.config.ui.buftab.style = require('neviraide-ui.kitty').buftab_style
    if vim.g.n then
      require('neviraide-ui.kitty').check_nonicons(M.config.kitty.conf_path)
    end
  end

  if M.config.ui.hyde then
    require('neviraide-ui.utils.change_settings.theme').change_theme(hyprTheme)
  else
    require('which-key').register({
      ['<leader>sC'] = {
        function()
          require('neviraide-ui.utils.change_settings.theme').choose_theme()
        end,
        'Colorscheme',
      },
    })
  end
end

function M.cmd(name) require('neviraide-ui.commands').cmd(name) end

return M
