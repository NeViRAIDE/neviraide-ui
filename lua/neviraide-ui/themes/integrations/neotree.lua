local colors = require('neviraide-ui.themes').get_theme_tb('base_30')

return {
  NeoTreeEmptyDirectoryName = { link = 'Directory' },
  NeoTreeEndOfBuffer = { fg = colors.darker_black },
  NeoTreeDirectoryIcon = { link = 'Directory' },
  NeoTreeDirectoryName = { link = 'Directory' },
  NeoTreeGitDirty = { fg = colors.red },
  NeoTreeIndentMarker = { fg = colors.grey_fg },
  NeoTreeNormal = { bg = colors.darker_black },
  NeoTreeNormalNC = { bg = colors.darker_black },
  NeoTreeOpenedDirectoryName = { fg = colors.folder_bg },
  NeoTreeGitIgnored = { fg = colors.light_grey },

  NeoTreeWinSeparator = {
    fg = colors.darker_black,
    bg = colors.darker_black,
  },

  NeoTreeWindowPicker = {
    fg = colors.red,
    bg = colors.black2,
  },

  NeoTreeCursorLine = {
    bg = colors.black2,
  },

  NeoTreeGitNew = {
    fg = colors.yellow,
  },

  NeoTreeGitDeleted = {
    fg = colors.red,
  },

  NeoTreeSpecialFile = {
    fg = colors.yellow,
    bold = true,
  },

  NeoTreeRootDirectory = {
    fg = colors.red,
    bold = true,
  },
}
