local color = require('neviraide-ui.themes.colors').palette
local generate_color =
  require('neviraide-ui.themes.colors').change_hex_lightness

return {
  -- lazy.nvim
  LazyH1 = {
    bg = color.inactive_accent,
    fg = color.second_background,
  },

  LazyButton = {
    bg = color.grey,
    fg = generate_color(color.grey, vim.o.bg == 'dark' and 10 or -20),
  },

  LazyH2 = {
    fg = color.red,
    bold = true,
    underline = true,
  },
  LazyNormal = { bg = color.background },
  LazyReasonPlugin = { fg = color.red },
  LazyValue = { fg = color.teal },
  LazyDir = { fg = color.white },
  LazyUrl = { fg = color.white },
  LazyCommit = { fg = color.blue },
  LazyNoCond = { fg = color.red },
  LazySpecial = { fg = color.green },
  LazyReasonFt = { fg = color.purple },
  LazyOperator = { fg = color.white },
  LazyReasonKeys = { fg = color.teal },
  LazyTaskOutput = { fg = color.white },
  LazyCommitIssue = { fg = color.pink },
  LazyReasonEvent = { fg = color.yellow },
  LazyReasonStart = { fg = color.white },
  LazyReasonRuntime = { fg = color.nord_blue },
  LazyReasonCmd = { fg = color.sun },
  LazyReasonSource = { fg = color.cyan },
  LazyReasonImport = { fg = color.white },
  LazyProgressDone = { fg = color.blue },
}
