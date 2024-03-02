local color = require('neviraide-ui.themes.colors').palette

local syntax = {
  Boolean = { fg = color.yellow },
  Character = { fg = color.bright_red },
  Conditional = { fg = color.magenta },
  Constant = { fg = color.bright_red },
  Define = { fg = color.magenta, sp = 'none' },
  Delimiter = { fg = color.red },
  Float = { fg = color.yellow },
  Variable = { fg = color.white },
  Function = { fg = color.blue },
  Identifier = { fg = color.bright_red, sp = 'none' },
  Include = { fg = color.blue },
  Keyword = { fg = color.magenta },
  Label = { fg = color.bright_yellow },
  Number = { fg = color.yellow },
  Operator = { fg = color.white, sp = 'none' },
  PreProc = { fg = color.bright_yellow },
  Repeat = { fg = color.bright_yellow },
  Special = { fg = color.cyan },
  SpecialChar = { fg = color.red },
  Statement = { fg = color.bright_red },
  StorageClass = { fg = color.bright_yellow },
  String = { fg = color.green },
  Structure = { fg = color.magenta },
  Tag = { fg = color.bright_yellow },
  Todo = { fg = color.bright_yellow, bg = color.black },
  Type = { fg = color.bright_yellow, sp = 'none' },
  Typedef = { fg = color.bright_yellow },
}

return syntax
