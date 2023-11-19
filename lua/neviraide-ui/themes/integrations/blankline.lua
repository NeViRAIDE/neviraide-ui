local colors = require('neviraide-ui.themes').get_theme_tb('base_30')

return {
  IndentBlanklineChar = { fg = colors.line },
  IndentBlanklineSpaceChar = { fg = colors.line },
  IndentBlanklineContextChar = { fg = colors.grey },
  IndentBlanklineContextStart = { bg = colors.one_bg2 },
  IndentBlanklineIndent1 = { fg = colors.red },
  IndentBlanklineIndent2 = { fg = colors.yellow },
  IndentBlanklineIndent3 = { fg = colors.blue },
  IndentBlanklineIndent4 = { fg = colors.orange },
  IndentBlanklineIndent5 = { fg = colors.vibrant_green },
  IndentBlanklineIndent6 = { fg = colors.purple },
}
