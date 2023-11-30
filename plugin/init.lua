require('neviraide-ui')

if require('neviraide-ui').config.hyprTheme then
  local hyprTheme = require('neviraide-ui.hyprland.utils').get_theme_from_hypr()
  require('neviraide-ui.utils.change_theme').change_theme(hyprTheme)
  require('neviraide.utils.reload_config').reload_config()
end

require('neviraide-ui.themes').load_all_highlights()
