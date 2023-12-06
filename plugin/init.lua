require('neviraide-ui')

vim.opt.statusline = '%!v:lua.require("neviraide-ui.statusline").run()'

require('neviraide-ui.buftabline.lazyload')
require('usercommands')

vim.defer_fn(function()
  local bufs = vim.api.nvim_list_bufs()

  if #vim.fn.argv() == 0 and (#bufs == 1 and bufs[1] == 1) then
    require('neviraide-ui.dashboard').open()
    vim.api.nvim_exec2(':bd#', { output = true })
  end
end, 0)

require('autocommands')

require('neviraide-ui.override_vim_ui.input')
require('neviraide-ui.override_vim_ui.select')

if require('neviraide-ui.config').options.hyprTheme then
  local hyprTheme = require('neviraide-ui.hyprland.utils').get_theme_from_hypr()

  require('neviraide-ui.utils.change_theme').change_theme(hyprTheme)
  require('neviraide.utils.reload_config').reload_config()
end

require('neviraide-ui.themes').load_all_highlights()
