local icon = require('neviraide-ui.icons.utils').icon

return {
  {
    'Create new file',
    '',
    'lua require("neviraide-ui.utils.new_file")()',
  },
  { 'Find file', icon('','search',0,0), 'Telescope find_files' },
  { 'Recent files', '', 'Telescope oldfiles' },
  { 'Find word', '', 'Telescope live_grep' },
  {
    'TODO list',
    '',
    'TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=14}}',
  },
  { 'Check health', '', 'checkhealth' },
  { 'Plugin manager', '', 'Lazy' },
  {
    'Configuration',
    '',
    'e ~/.config/nvim/lua/NEVIRAIDE.lua',
  },
  { 'Exit', '', 'qa' },
}
