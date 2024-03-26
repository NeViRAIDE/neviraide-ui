---@type Colorscheme
local M = {}

M.type = 'dark'
M.borders = 'rounded'

M.colors = {
  background = '#24283b',
  second_background = '#16161e',
  active_accent = '#3d59a1',
  inactive_accent = '#2043a1',
  foreground = '#c0caf5',

  white = '#c0caf5',
  black = '#1a1b26',
  grey = '#40486a',

  red = '#f7768e',
  orange = '#ff9e64',
  yellow = '#e0af68',
  green = '#9ece6a',
  cyan = '#7dcfff',
  blue = '#7aa2f7',
  magenta = '#9d7cd8',

  teal = '#1abc9c',
  nord_blue = '#80a8fd',
  baby_pink = '#DE8C92',
  pink = '#ff75a0',

  bright_black = '#1a1a1a',
  bright_green = '#73daca',
  brigth_yellow = '#EBCB8B',
  bright_magenta = '#bb9af7',
}

M.polish_hl = {
  ['@variable'] = { fg = M.colors.white },
  ['@punctuation.bracket'] = { fg = M.colors.bright_magenta },
  ['@method.call'] = { fg = M.colors.red },
  ['@function.call'] = { fg = M.colors.blue },
  ['@constant'] = { fg = M.colors.orange },
  ['@parameter'] = { fg = M.colors.orange },
}

return M
