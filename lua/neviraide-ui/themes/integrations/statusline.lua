local colors = require('neviraide-ui.themes').get_theme_tb('base_30')
local merge_tb = vim.tbl_deep_extend

local statusline_theme = 'default'

local statusline_bg = colors.statusline_bg
local light_grey = colors.light_grey

if NEVIRAIDE().transparency then statusline_bg = 'NONE' end

local Lsp_highlights = {
  St_lspError = {
    fg = colors.red,
    bg = statusline_bg,
  },

  St_lspWarning = {
    fg = colors.yellow,
    bg = statusline_bg,
  },

  St_LspHints = {
    fg = colors.purple,
    bg = statusline_bg,
  },

  St_LspInfo = {
    fg = colors.green,
    bg = statusline_bg,
  },
}

local M = {}

M.default = {
  StatusLine = {
    bg = statusline_bg,
  },

  St_gitIcons = {
    fg = light_grey,
    bg = statusline_bg,
    bold = true,
  },

  St_LspStatus = {
    fg = colors.nord_blue,
    bg = statusline_bg,
  },

  St_LspProgress = {
    fg = colors.green,
    bg = statusline_bg,
  },

  St_LspStatus_Icon = {
    fg = colors.nord_blue,
    bg = statusline_bg,
  },

  St_EmptySpace = {
    fg = colors.grey,
    bg = colors.lightbg,
  },

  St_EmptySpace2 = {
    fg = colors.grey,
    bg = statusline_bg,
  },

  St_file_info = {
    bg = colors.lightbg,
    fg = colors.white,
  },

  St_file_sep = {
    bg = statusline_bg,
    fg = colors.lightbg,
  },

  St_cwd_icon = {
    fg = colors.one_bg,
    bg = colors.red,
  },

  St_cwd_text = {
    fg = colors.white,
    bg = colors.lightbg,
  },

  St_cwd_sep = {
    fg = colors.red,
    bg = statusline_bg,
  },

  St_pos_sep = {
    fg = colors.green,
    bg = colors.lightbg,
  },

  St_pos_icon = {
    fg = colors.black,
    bg = colors.green,
  },

  St_pos_text = {
    fg = colors.green,
    bg = colors.lightbg,
  },
}

-- add common lsp highlights
M.default = merge_tb('force', M.default, Lsp_highlights)

local function genModes_hl(modename, col)
  M.default['St_' .. modename .. 'Mode'] = { bg = 'none', fg = colors[col] }
  M.default['St_' .. modename .. 'ModeSep'] =
    { fg = colors[col], bg = colors.grey }
end

-- add mode highlights
if statusline_theme == 'default' then
  genModes_hl('Normal', 'nord_blue')
else
  genModes_hl('Normal', 'blue')
end

genModes_hl('Visual', 'cyan')
genModes_hl('Insert', 'dark_purple')
genModes_hl('Terminal', 'green')
genModes_hl('NTerminal', 'yellow')
genModes_hl('Replace', 'orange')
genModes_hl('Confirm', 'teal')
genModes_hl('Command', 'green')
genModes_hl('Select', 'blue')

return M[statusline_theme]
