local M = {}
local dd = {
  localosewater = '#f2d5cf',
  flamingo = '#eebebe',
  mauve = '#ca9ee6',
  maroon = '#ea999c',
  peach = '#ef9f76',
  sky = '#99d1db',
  sapphire = '#85c1dc',
  subtext1 = '#b5bfe2',
  subtext0 = '#a5adce',
  overlay2 = '#949cbb',
  overlay1 = '#838ba7',
  overlay0 = '#737994',
  surface2 = '#626880',
  surface1 = '#51576d',
  surface0 = '#414559',
  mantle = '#292c3c',
  crust = '#232634',
}

M.base_30 = {
  white = '#D9E0EE',
  darker_black = '#191828',
  black = '#1E1D2D', --  nvim bg
  black2 = '#252434',
  one_bg = '#2d2c3c', -- real bg of onedark
  one_bg2 = '#363545',
  one_bg3 = '#3e3d4d',
  grey = '#474656',
  grey_fg = '#4e4d5d',
  grey_fg2 = '#555464',
  light_grey = '#605f6f',
  red = '#e78284',
  baby_pink = '#ffa5c3',
  pink = '#f4b8e4',
  line = '#383747', -- for lines like vertsplit
  green = '#a6d189',
  vibrant_green = '#b6f4be',
  nord_blue = '#8bc2f0',
  blue = '#8caaee',
  yellow = '#e5c890',
  sun = '#ffe9b6',
  purple = '#ca9ee6',
  dark_purple = '#c7a0dc',
  teal = '#81c8be',
  orange = '#F8BD96',
  cyan = '#89DCEB',
  statusline_bg = '#232232',
  lightbg = '#2f2e3e',
  pmenu_bg = '#ABE9B3',
  folder_bg = '#89B4FA',
  lavender = '#babbf1',
}

M.base_16 = {
  base00 = '#303446',
  base01 = '#282737',
  base02 = '#2f2e3e',
  base03 = '#383747',
  base04 = '#414050',
  base05 = '#c6d0f5',
  base06 = '#ccd3e1',
  base07 = '#D9E0EE',
  base08 = '#F38BA8',
  base09 = '#F8BD96',
  base0A = '#FAE3B0',
  base0B = '#ABE9B3',
  base0C = '#89DCEB',
  base0D = '#89B4FA',
  base0E = '#CBA6F7',
  base0F = '#F38BA8',
}

M.polish_hl = {
  ['@variable'] = { fg = M.base_30.lavender },
  ['@property'] = { fg = M.base_30.teal },
  ['@variable.builtin'] = { fg = M.base_30.red },
}

M.type = 'dark'

return M
