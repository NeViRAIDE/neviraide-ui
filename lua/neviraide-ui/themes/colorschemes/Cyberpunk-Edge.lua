---@type Colorscheme
local M = {}

M.type = 'dark'
M.borders = 'double'

M.colors = {
  background = '#000000',
  second_background = '#000000',
  foreground = '#FDF500',
  active_accent = '#fdf600',
  inactive_accent = '#43465A',

  white = '#D8DEE9',
  black = '#1F2229',
  grey = '#424242',
  red = '#D62246',
  baby_pink = '#eca8a8',
  pink = '#da838b',
  green = '#4DBD4F',
  blue = '#F29C6B',
  nord_blue = '#FFA6C2',
  yellow = '#FDF500',
  magenta = '#A56DF2',
  teal = '#37EBF3',
  orange = '#efb6a0',
  cyan = '#2CF6B3',

  bright_black = '#1b1c22',
  bright_red = '#ec0101',
  bright_yellow = '#eff6ab',
  bright_green = '#1F5322',
  bright_magenta = '#564873',
}

M.polish_hl = {
  treesitter = {
    ['@punctuation.bracket'] = { fg = M.colors.red },
  },
  defaults = {
    FloatBorder = { fg = M.colors.yellow },
  },
}

return M
