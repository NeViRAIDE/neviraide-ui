local color = require('neviraide-ui.themes.colors').palette

return {
  diffOldFile = { fg = color.baby_pink },
  diffNewFile = { fg = color.blue },
  DiffAdd = { fg = color.blue },
  DiffAdded = { fg = color.green },
  DiffChange = { fg = color.light_grey },
  DiffChangeDelete = { fg = color.red },
  DiffModified = { fg = color.orange },
  DiffDelete = { fg = color.red },
  DiffRemoved = { fg = color.red },
  DiffText = { fg = color.white, bg = color.black2 },

  -- git commits
  gitcommitOverflow = { fg = color.bright_red },
  gitcommitSummary = { fg = color.green },
  gitcommitComment = { fg = color.one_bg2 },
  gitcommitUntracked = { fg = color.one_bg2 },
  gitcommitDiscarded = { fg = color.one_bg2 },
  gitcommitSelected = { fg = color.one_bg2 },
  gitcommitHeader = { fg = color.magenta },
  gitcommitSelectedType = { fg = color.blue },
  gitcommitUnmergedType = { fg = color.blue },
  gitcommitDiscardedType = { fg = color.blue },
  gitcommitBranch = { fg = color.yellow, bold = true },
  gitcommitUntrackedFile = { fg = color.bright_yellow },
  gitcommitUnmergedFile = { fg = color.bright_red, bold = true },
  gitcommitDiscardedFile = { fg = color.bright_red, bold = true },
  gitcommitSelectedFile = { fg = color.green, bold = true },
}
