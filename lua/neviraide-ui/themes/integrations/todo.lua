local color = require('neviraide-ui.themes.colors').palette

return {
  TodoBgFix = { fg = color.black2, bg = color.red, bold = true },
  TodoBgHack = { fg = color.black2, bg = color.orange, bold = true },
  TodoBgNote = { fg = color.black2, bg = color.white, bold = true },
  TodoBgPerf = { fg = color.black2, bg = color.purple, bold = true },
  TodoBgTest = { fg = color.black2, bg = color.purple, bold = true },
  TodoBgTodo = { fg = color.black2, bg = color.yellow, bold = true },
  TodoBgWarn = { fg = color.orange, bold = true },
  TodoFgFix = { fg = color.red },
  TodoFgHack = { fg = color.orange },
  TodoFgNote = { fg = color.white },
  TodoFgPerf = { fg = color.purple },
  TodoFgTest = { fg = color.purple },
  TodoFgTodo = { fg = color.yellow },
  TodoFgWarn = { fg = color.orange },
  TodoSignFix = { link = 'TodoFgFix' },
  TodoSignHack = { link = 'TodoFgHack' },
  TodoSignNote = { link = 'TodoFgNote' },
  TodoSignPerf = { link = 'TodoFgPerf' },
  TodoSignTest = { link = 'TodoFgTest' },
  TodoSignTodo = { link = 'TodoFgTodo' },
  TodoSignWarn = { link = 'TodoFgWarn' },
}
