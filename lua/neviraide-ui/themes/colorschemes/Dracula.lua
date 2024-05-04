---@type Colorscheme
local M = {}

M.type = 'dark'
M.borders = 'rounded'

M.colors = {
  background = '#282A36',
  second_background = '#0d0f18',
  tab_background = '#f8f8f2',
  foreground = '#f8f8f2',
  active_accent = '#A6BAB5',
  inactive_accent = '#556B6B',

  white = '#ABB2BF',
  black = '#191A21',
  grey = '#44475A',

  red = '#FF5555',
  orange = '#FFB86C',
  yellow = '#F1FA8C',
  green = '#50fa7b',
  cyan = '#8BE9FD',
  blue = '#86aaec',
  magenta = '#BD93F9',

  baby_pink = '#c79bf0',
  pink = '#FF79C6',
  nord_blue = '#A4FFFF',
  teal = '#7ddac5',

  bright_black = '#1c1e27',
  bright_green = '#69FF94',
  bright_yellow = '#FFFFA5',
  bright_magenta = '#FF92DF',
}

M.polish_hl = {
  ['@constant'] = { fg = M.colors.yellow },
}

return M
