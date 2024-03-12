---@type Colorscheme
local M = {}

M.type = 'dark'
M.borders = 'rounded'

M.colors = {
  background = '#0d0f18',
  second_background = '#0d0f18',
  foreground = '#a5b6cf',
  active_accent = '#A6BAB5',
  inactive_accent = '#556B6B',

  white = '#cbced3',
  black = '#171B20', --  nvim bg
  grey = '#41454a',
  red = '#e26c7c',
  baby_pink = '#c79bf0',
  pink = '#c296eb',
  green = '#78DBA9',
  blue = '#86aaec',
  nord_blue = '#96b5ee',
  yellow = '#ecd3a0',
  magenta = '#b77bdf',
  teal = '#7ddac5',
  orange = '#e9a180',
  cyan = '#98d3ee',

  bright_black = '#1c1e27',
  bright_green = '#87eab8',
  bright_yellow = '#f1d8a5',
  brigth_magenta = '#c68aee',
}

M.polish_hl = {
  ['@constant'] = { fg = M.colors.yellow },
}

return M
