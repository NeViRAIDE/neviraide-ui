local color = require('neviraide-ui.themes.colors').palette

return {
  MasonHeader = { bg = color.red, fg = color.black },
  MasonHighlight = { fg = color.blue },
  MasonHighlightBlock = { fg = color.black, bg = color.green },
  MasonHighlightBlockBold = { link = 'MasonHighlightBlock' },
  MasonHeaderSecondary = { link = 'MasonHighlightBlock' },
  MasonMuted = { fg = color.light_grey },
  MasonMutedBlock = { fg = color.light_grey, bg = color.one_bg },
}
