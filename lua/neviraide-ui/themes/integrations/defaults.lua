local colors = require('neviraide-ui.themes').get_theme_tb('base_30')
local theme = require('neviraide-ui.themes').get_theme_tb('base_16')

local kitty = require('neviraide-ui.hyprland.utils').colors.kitty
-- TODO: make no borders or borders for themes

local defaults = {
  TermBG = {
    bg = kitty.tab_bar_background,
  },

  LineSeparator = {
    bg = kitty.background,
    fg = kitty.background,
  },

  MatchWord = {
    bg = colors.grey,
    fg = colors.white,
  },

  WinBar = { bg = kitty.background },
  WinBarNC = { link = 'WinBar' },

  Pmenu = { bg = colors.one_bg },
  PmenuSbar = { bg = colors.one_bg },
  -- PmenuSel = { bg = accent.active_bg, fg = accent.foreground, bold = true },
  PmenuThumb = { bg = colors.grey },

  MatchParen = { link = 'MatchWord' },

  Comment = { fg = colors.grey_fg, italic = true },

  CursorLineNr = { fg = colors.white },
  LineNr = { fg = colors.grey },

  -- floating windows
  -- FloatBorder = { fg = accent.background },
  NormalFloat = { bg = 'none' },

  NvimInternalError = { fg = colors.red },
  -- FIX: this color for terminals, and change fg color for sipmle windows
  WinSeparator = { fg = kitty.background, bg = kitty.background },

  Normal = {
    fg = theme.base05,
    bg = theme.base00,
  },

  Bold = {
    bold = true,
  },

  Debug = {
    fg = theme.base08,
  },

  Directory = {
    fg = kitty.inactive_tab_foreground,
  },

  Error = {
    fg = theme.base00,
    bg = theme.base08,
  },

  ErrorMsg = {
    fg = theme.base08,
    bg = theme.base00,
  },

  Exception = {
    fg = theme.base08,
  },

  FoldColumn = {
    fg = theme.base0C,
    bg = theme.base01,
  },

  Folded = {
    fg = theme.base03,
    bg = theme.base01,
  },

  IncSearch = {
    fg = theme.base01,
    bg = theme.base09,
  },

  Italic = {
    italic = true,
  },

  Macro = {
    fg = theme.base08,
  },

  ModeMsg = {
    fg = theme.base0B,
  },

  MoreMsg = {
    fg = theme.base0B,
  },

  Question = {
    fg = theme.base0D,
  },

  Search = {
    fg = theme.base01,
    bg = theme.base0A,
  },

  Substitute = {
    fg = theme.base01,
    bg = theme.base0A,
    sp = 'none',
  },

  SpecialKey = {
    fg = theme.base03,
  },

  TooLong = {
    fg = theme.base08,
  },

  UnderLined = {
    underline = true,
  },

  Visual = {
    bg = theme.base02,
  },

  VisualNOS = {
    fg = theme.base08,
  },

  WarningMsg = {
    fg = theme.base08,
  },

  WildMenu = {
    fg = theme.base08,
    bg = theme.base0A,
  },

  Title = {
    fg = theme.base0D,
    sp = 'none',
  },

  Conceal = {
    bg = 'NONE',
  },

  Cursor = {
    fg = theme.base00,
    bg = theme.base05,
  },

  NonText = {
    fg = theme.base03,
  },

  SignColumn = {
    fg = theme.base03,
    sp = 'NONE',
  },

  ColorColumn = {
    bg = theme.base01,
    sp = 'none',
  },

  CursorColumn = {
    bg = theme.base01,
    sp = 'none',
  },

  CursorLine = {
    bg = theme.base01,
    sp = 'none',
  },

  QuickFixLine = {
    bg = theme.base01,
    sp = 'none',
  },

  -- spell
  SpellBad = {
    undercurl = true,
    sp = theme.base08,
  },

  SpellLocal = {
    undercurl = true,
    sp = theme.base0C,
  },

  SpellCap = {
    undercurl = true,
    sp = theme.base0D,
  },

  SpellRare = {
    undercurl = true,
    sp = theme.base0E,
  },

  healthSuccess = {
    bg = colors.green,
    fg = colors.black,
  },

  NeviraideTerminalDarkerBG = { bg = kitty.tab_bar_background },
  NeviraideHelpDarkerBG = { bg = kitty.tab_bar_background },
  NeviraideTerminalWinbar = { bg = kitty.tab_bar_background },
}

local merge_tb = require('neviraide-ui.themes').merge_tb
defaults = merge_tb(
  defaults,
  require('neviraide-ui.themes').load_highlight('statusline')
)

if vim.g.b == 'none' or vim.g.b == 'shadow' or vim.g.b == 'solid' then
  defaults.FloatBorder = { bg = colors.one_bg, fg = colors.one_bg }
  defaults.NormalFloat = { bg = colors.one_bg }
  defaults.NuiTitle = { bg = colors.green, fg = colors.black }
end

return defaults
