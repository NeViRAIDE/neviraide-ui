local color = require('neviraide-ui.themes.colors').palette

return {
  NeoTreeNormal = {
    bg = color.second_background,
    fg = color.active_accent,
  },
  NeoTreeNormalNC = { link = 'NeoTreeNormal' },
  NeoTreeEndOfBuffer = { bg = color.second_background },
  NeoTreeCursorLine = { bg = color.black },

  NeoTreeDirectoryIcon = { link = 'Directory' },
  NeoTreeDirectoryName = { link = 'Directory' },
  NeoTreeRootDirectory = { fg = color.red, bold = true },
  NeoTreeOpenedDirectoryName = { link = 'Directory' },
  NeoTreeEmptyDirectoryName = { link = 'Directory' },

  NeoTreeGitDirty = { fg = color.red },
  NeoTreeIndentMarker = { fg = color.grey },

  NeoTreeWinSeparator = {
    bg = color.second_background,
    fg = color.second_background,
  },
  NeoTreeWindowPicker = { fg = color.red, bg = color.black },

  NeoTreeGitNew = { link = 'diffNewFile' },
  NeoTreeGitModified = { link = 'DiffModified' },
  NeoTreeGitDeleted = { link = 'DiffRemoved' },
  NeoTreeGitIgnored = { fg = color.grey },

  NeoTreeSpecialFile = { fg = color.yellow, bold = true },
}
