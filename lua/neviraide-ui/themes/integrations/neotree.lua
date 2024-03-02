local color = require('neviraide-ui.themes.colors').palette

return {
  NeoTreeEmptyDirectoryName = { link = 'Directory' },
  NeoTreeEndOfBuffer = { bg = color.tab_bar_background },
  NeoTreeDirectoryIcon = { link = 'Directory' },
  NeoTreeDirectoryName = { link = 'Directory' },
  NeoTreeGitDirty = { fg = color.red },
  NeoTreeIndentMarker = { fg = color.grey_fg },
  NeoTreeNormal = {
    bg = color.tab_bar_background,
    fg = color.active_tab_foreground,
  },
  NeoTreeNormalNC = { link = 'NeoTreeNormal' },
  NeoTreeOpenedDirectoryName = { fg = color.folder_bg },
  NeoTreeGitIgnored = { fg = color.light_grey },
  NeoTreeWinSeparator = { link = 'LineSeparator' },
  NeoTreeWindowPicker = { fg = color.red, bg = color.black2 },
  NeoTreeCursorLine = { bg = color.black2 },
  NeoTreeGitNew = { link = 'diffNewFile' },
  NeoTreeGitModified = { link = 'DiffModified' },
  NeoTreeGitDeleted = { link = 'DiffRemoved' },
  NeoTreeSpecialFile = { fg = color.yellow, bold = true },
  NeoTreeRootDirectory = { fg = color.red, bold = true },
}
