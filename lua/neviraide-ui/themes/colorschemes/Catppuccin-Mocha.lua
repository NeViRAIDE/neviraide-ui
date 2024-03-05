---@type Colorscheme
local M = {}

M.type = 'dark'
M.borders = 'solid'

M.colors = {
  tab_bar_background = '#110e14',
  white = '#D9E0EE',
  darker_black = '#191828',
  black = '#1E1E2E', --  nvim bg
  background = '#1E1E2E', --  nvim bg
  black2 = '#252434',
  one_bg = '#2d2c3c', -- real bg of onedark
  one_bg2 = '#363545',
  one_bg3 = '#3e3d4d',
  accent = '#CBA6F7',
  grey = '#474656',
  grey_fg = '#4e4d5d',
  grey_fg2 = '#555464',
  light_grey = '#605f6f',
  red = '#f38ba8',
  baby_pink = '#ffa5c3',
  pink = '#f5c2e7',
  line = '#383747', -- for lines like vertsplit
  green = '#a6e3a1',
  bright_green = '#b6f4be',
  nord_blue = '#8bc2f0',
  blue = '#89b4fa',
  yellow = '#f9e2af',
  sun = '#ffe9b6',
  purple = '#d0a9e5',
  dark_purple = '#cba6f7',
  teal = '#B5E8E0',
  orange = '#fab387',
  cyan = '#89DCEB',
  statusline_bg = '#232232',
  lightbg = '#2f2e3e',
  pmenu_bg = '#ABE9B3',
  folder_bg = '#89B4FA',
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
