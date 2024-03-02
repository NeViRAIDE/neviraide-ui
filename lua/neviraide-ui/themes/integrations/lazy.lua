local color = require('neviraide-ui.themes.colors').palette
local generate_color =
  require('neviraide-ui.themes.colors').change_hex_lightness

return {
  -- lazy.nvim
  LazyH1 = {
    bg = color.green,
    fg = color.black,
  },

  LazyButton = {
    bg = color.one_bg,
    fg = generate_color(color.light_grey, vim.o.bg == 'dark' and 10 or -20),
  },

  LazyH2 = {
    fg = color.red,
    bold = true,
    underline = true,
  },

  LazyReasonPlugin = { fg = color.red },
  LazyValue = { fg = color.teal },
  LazyDir = { fg = color.white },
  LazyUrl = { fg = color.white },
  LazyCommit = { fg = color.green },
  LazyNoCond = { fg = color.red },
  LazySpecial = { fg = color.blue },
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
  LazyProgressDone = { fg = color.green },
}
