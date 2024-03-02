local color = require('neviraide-ui.themes.colors').palette

local defaults = {
  TermBG = {
    bg = color.tab_bar_background,
  },

  LineSeparator = {
    bg = color.tab_bar_background,
    fg = color.tab_bar_background,
  },

  MatchWord = {
    bg = color.grey,
    fg = color.white,
  },

  WinBar = { bg = color.background },
  WinBarNC = { link = 'WinBar' },

  Pmenu = { bg = color.one_bg },
  PmenuSbar = { bg = color.one_bg },
  -- PmenuSel = { bg = accent.active_bg, fg = accent.foreground, bold = true },
  PmenuThumb = { bg = color.grey },

  MatchParen = { link = 'MatchWord' },

  Comment = { fg = color.grey_fg, italic = true },

  CursorLineNr = { fg = color.white },
  LineNr = { fg = color.grey },

  -- floating windows
  -- FloatBorder = { fg = color.terminal.yellow },
  -- NormalFloat = { bg = 'none' },

  NvimInternalError = { fg = color.red },
  WinSeparator = {
    fg = color.background,
    bg = color.background,
  },

  Normal = {
    fg = color.white,
    bg = color.background,
  },

  Bold = {
    bold = true,
  },

  Debug = {
    fg = color.bright_red,
  },

  Directory = {
    fg = color.inactive_tab_foreground,
  },

  Error = {
    fg = color.background,
    bg = color.bright_red,
  },

  ErrorMsg = {
    fg = color.bright_red,
    bg = color.background,
  },

  Exception = {
    fg = color.bright_red,
  },

  FoldColumn = {
    fg = color.cyan,
    bg = color.black,
  },

  Folded = {
    fg = color.bright_black,
    bg = color.black,
  },

  IncSearch = {
    fg = color.background,
    bg = color.orange,
  },

  Italic = {
    italic = true,
  },

  Macro = {
    fg = color.bright_red,
  },

  ModeMsg = {
    fg = color.green,
  },

  MoreMsg = {
    fg = color.green,
  },

  Question = {
    fg = color.bright_blue,
  },

  Search = {
    fg = color.black,
    bg = color.bright_yellow,
  },

  Substitute = {
    fg = color.black,
    bg = color.bright_yellow,
    sp = 'none',
  },

  SpecialKey = {
    fg = color.bright_black,
  },

  TooLong = {
    fg = color.bright_red,
  },

  UnderLined = {
    underline = true,
  },

  Visual = {
    bg = color.one_bg,
  },

  VisualNOS = {
    fg = color.bright_red,
  },

  WarningMsg = {
    fg = color.bright_red,
  },

  WildMenu = {
    fg = color.bright_red,
    bg = color.bright_yellow,
  },

  Title = {
    fg = color.bright_blue,
    sp = 'none',
  },

  Conceal = {
    bg = 'NONE',
  },

  Cursor = {
    fg = color.background,
    bg = color.white,
  },

  NonText = {
    fg = color.bright_black,
  },

  SignColumn = {
    fg = color.bright_black,
    sp = 'NONE',
  },

  ColorColumn = {
    bg = color.black,
    sp = 'none',
  },

  CursorColumn = {
    bg = color.black,
    sp = 'none',
  },

  CursorLine = {
    bg = color.black,
    sp = 'none',
  },

  QuickFixLine = {
    bg = color.black,
    sp = 'none',
  },

  -- spell
  SpellBad = {
    undercurl = true,
    sp = color.bright_red,
  },

  SpellLocal = {
    undercurl = true,
    sp = color.cyan,
  },

  SpellCap = {
    undercurl = true,
    sp = color.bright_blue,
  },

  SpellRare = {
    undercurl = true,
    sp = color.magenta,
  },

  healthSuccess = {
    bg = color.green,
    fg = color.backgroung,
  },

  NeviraideTerminalDarkerBG = { bg = color.tab_bar_background },
  NeviraideHelpDarkerBG = { bg = color.tab_bar_background },
  NeviraideTerminalWinbar = { bg = color.tab_bar_background },
}

-- local merge_tb = require('neviraide-ui.themes').merge_tb
-- defaults = merge_tb(
--   defaults,
--   require('neviraide-ui.themes').load_highlight('statusline')
-- )

if vim.g.b == 'none' or vim.g.b == 'shadow' or vim.g.b == 'solid' then
  defaults.FloatBorder = {
    bg = color.tab_bar_background,
    fg = color.tab_bar_background,
  }
  defaults.NormalFloat = { bg = color.grey }
  defaults.NuiTitle = { bg = color.green, fg = color.background, bold = true }
end

return defaults
