---@type Colorscheme
local M = {}

M.type = 'dark'
M.borders = 'solid'

M.colors = {
  tab_bar_background = '#110e14',
  background = '#1E1E2E', --  nvim bg
  grey = '#474656',
  white = '#D9E0EE',
  red = '#f38ba8',
  orange = '#fab387',
  yellow = '#f9e2af',
  green = '#a6e3a1',
  cyan = '#89DCEB',
  blue = '#89b4fa',
  magenta = '#cba6f7',
  bright_red = '#f5c2e7',
  bright_yellow = '#ffe9b6',
  bright_green = '#b6f4be',
  bright_magenta = '#d0a9e5',

  darker_black = '#191828',
  black = '#1E1E2E', --  nvim bg
  black2 = '#252434',
  one_bg = '#2d2c3c', -- real bg of onedark
  one_bg2 = '#363545',
  one_bg3 = '#3e3d4d',
  grey_fg = '#4e4d5d',
  grey_fg2 = '#555464',
  light_grey = '#605f6f',
  line = '#383747', -- for lines like vertsplit

  nord_blue = '#8bc2f0',
  baby_pink = '#ffa5c3',
  teal = '#B5E8E0',
  lavender = '#b4befe',
}

M.polish_hl = {
  treesitter = {
    ['@variable'] = { fg = M.colors.lavender },
    ['@property'] = { fg = M.colors.teal },
    ['@variable.builtin'] = { fg = M.colors.red },
  },
}

return M
