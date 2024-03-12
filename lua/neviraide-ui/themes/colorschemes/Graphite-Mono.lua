---@type Colorscheme
local M = {}

M.borders = 'solid'
M.type = 'dark'

M.colors = {
  background = '#242424',
  second_background = '#09161c',
  foreground = '#ffffff',
  active_accent = '#D9E0EE',
  inactive_accent = '#43465A',

  white = '#D8DEE9',
  black = '#101010', --  nvim bg
  grey = '#424242',
  light_grey = '#677777',
  red = '#ec8989',
  baby_pink = '#eca8a8',
  pink = '#da838b',
  line = '#2e2e2e', -- for lines like vertsplit
  green = '#c9d36a',
  blue = '#8abae1',
  nord_blue = '#a5c6e1',
  yellow = '#ffe6b5',
  magenta = '#db9fe9',
  teal = '#6484a4',
  orange = '#efb6a0',
  cyan = '#9aafe6',

  bright_yellow = '#eff6ab',
  bright_black = '#1a1a1a',
  bright_green = '#eff6ab',
  bright_magenta = '#e1bee9',
}

M.polish_hl = {
  treesitter = {
    ['@punctuation.bracket'] = { fg = M.colors.red },
  },
}

return M
