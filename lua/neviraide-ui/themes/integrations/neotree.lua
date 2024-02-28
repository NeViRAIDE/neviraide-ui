local colors = require('neviraide-ui.themes').get_theme_tb('base_30')
local theme = require('neviraide-ui.themes').get_theme_tb('base_16')

return {
  NeoTreeEmptyDirectoryName = { link = 'Directory' },
  NeoTreeEndOfBuffer = { link = 'TermBG' },
  NeoTreeDirectoryIcon = { link = 'Directory' },
  NeoTreeDirectoryName = { link = 'Directory' },
  NeoTreeGitDirty = { fg = colors.red },
  NeoTreeIndentMarker = { fg = colors.grey_fg },
  NeoTreeNormal = { bg = theme.base00 },
  NeoTreeNormalNC = { bg = theme.base00 },
  NeoTreeOpenedDirectoryName = { fg = colors.folder_bg },
  NeoTreeGitIgnored = { fg = colors.light_grey },
  NeoTreeWinSeparator = { link = 'LineSeparator' },
  NeoTreeWindowPicker = { fg = colors.red, bg = colors.black2 },
  NeoTreeCursorLine = { bg = colors.black2 },
  NeoTreeGitNew = { link = 'diffNewFile' },
  NeoTreeGitModified = { link = 'DiffModified' },
  NeoTreeGitDeleted = { link = 'DiffRemoved' },
  NeoTreeSpecialFile = { fg = colors.yellow, bold = true },
  NeoTreeRootDirectory = { fg = colors.red, bold = true },
}
