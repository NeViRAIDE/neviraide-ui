local colors = require('neviraide-ui.themes').get_theme_tb('base_30')
local accent = require('neviraide-ui.hyprland.utils').wb_colors

return {
  NeoTreeEmptyDirectoryName = { link = 'Directory' },
  NeoTreeEndOfBuffer = { fg = accent.main_bg },
  NeoTreeDirectoryIcon = { link = 'Directory' },
  NeoTreeDirectoryName = { link = 'Directory' },
  NeoTreeGitDirty = { fg = colors.red },
  NeoTreeIndentMarker = { fg = colors.grey_fg },
  NeoTreeNormal = { bg = accent.main_bg },
  NeoTreeNormalNC = { bg = accent.main_bg },
  NeoTreeOpenedDirectoryName = { fg = colors.folder_bg },
  NeoTreeGitIgnored = { fg = colors.light_grey },
  NeoTreeWinSeparator = { fg = accent.main_bg, bg = accent.main_bg },
  NeoTreeWindowPicker = { fg = colors.red, bg = colors.black2 },
  NeoTreeCursorLine = { bg = colors.black2 },
  NeoTreeGitNew = { link = 'diffNewFile' },
  NeoTreeGitModified = { link = 'DiffModified' },
  NeoTreeGitDeleted = { link = 'DiffRemoved' },
  NeoTreeSpecialFile = { fg = colors.yellow, bold = true },
  NeoTreeRootDirectory = { fg = colors.red, bold = true },
}
