local icon = require('neviraide-ui.icons.utils').icon

return {
  {
    'Create new file',
    icon('', 'file'),
    'lua require("neviraide-ui.utils.new_file")()',
  },
  { 'Find file', icon('', 'search'), 'Telescope find_files' },
  { 'Recent files', icon('', 'sync'), 'Telescope oldfiles' },
  { 'Find word', icon('','codescan'), 'Telescope live_grep' },
  {
    'TODO list',
    icon('','tasklist'),
    'TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=14}}',
  },
  { 'Check health', icon('', 'heart'), 'checkhealth' },
  { 'Plugin manager', icon('', 'plug'), 'Lazy' },
  {
    'Configuration',
    icon('', 'gear'),
    'e ~/.config/nvim/lua/NEVIRAIDE.lua',
  },
  { 'Exit', icon('', 'sign-out'), 'qa' },
}
