---@type Colorscheme
local M = {}

M.type = 'dark'
M.borders = 'single'

M.colors = {
  background = '#282b2c',
  second_background = '#1a1d1e',
  foreground = '#575a5b',
  active_accent = '#D9E0EE',
  inactive_accent = '#43465A',

  white = '#c7b89d',
  black = '#282828',
  grey = '#484b4c',
  red = '#ec6b64',
  baby_pink = '#ce8196',
  pink = '#ff75a0',
  line = '#323536',
  green = '#89b482',
  nord_blue = '#6f8faf',
  blue = '#6d8dad',
  yellow = '#d6b676',
  magenta = '#887aa9',
  teal = '#749689',
  orange = '#e78a4e',
  cyan = '#82b3a8',

  bright_black = '#43465A',
  bright_yellow = '#d1c555',
  bright_green = '#a9b665',
  bright_magenta = '#9385b4',
}

M.polish_hl = {
  syntax = {
    Operator = { fg = M.colors.nord_blue },
  },

  treesitter = {
    ['@operator'] = { fg = M.colors.nord_blue },
  },
}

return M
