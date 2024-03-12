---@type Colorscheme
local M = {}

M.type = 'light'
M.borders = 'solid'

M.colors = {
  background = '#bcc0cc',
  second_background = '#9ca0b0',
  active_accent = '#575279',
  inactive_accent = '#776c79',
  foreground = '#4c4f69',

  white = '#f2e9de',
  black = '#faf4ed',
  grey = '#8c8fa1',
  red = '#d20f39',
  baby_pink = '#ffa5c3',
  pink = '#ea76cb',
  green = '#40a02b',
  nord_blue = '#8bc2f0',
  blue = '#1e66f5',
  yellow = '#ea9d34',
  magenta = '#907aa9',
  teal = '#56949f',
  orange = '#d7827e',
  cyan = '#04a5e5',
  lavender = '#7287fd',

  bright_yellow = '#ffe9b6',
  bright_green = '#b6f4be',
  bright_magenta = '#d0a9e5',
}

M.polish_hl = {
  treesitter = {
    ['@variable'] = { fg = M.colors.lavender },
    ['@property'] = { fg = M.colors.teal },
    ['@variable.builtin'] = { fg = M.colors.red },
  },
}

return M
