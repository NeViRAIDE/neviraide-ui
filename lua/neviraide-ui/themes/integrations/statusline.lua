local color = require('neviraide-ui.themes.colors').palette
local merge_tb = vim.tbl_deep_extend

local statusline_theme = 'default'

local statusline_bg = color.statusline_bg
local light_grey = color.light_grey

-- if NEVIRAIDE().transparency then statusline_bg = 'NONE' end
if vim.g.t then statusline_bg = 'NONE' end

local Lsp_highlights = {
  St_lspError = { fg = color.red, bg = 'none' },
  St_lspWarning = { fg = color.yellow, bg = 'none' },
  St_LspHints = { fg = color.purple, bg = 'none' },
  St_LspInfo = { fg = color.green, bg = 'none' },
}

local M = {}

M.default = {
  StatusLine = { bg = statusline_bg },
  St_gitIcons = { fg = light_grey, bg = statusline_bg, bold = true },
  St_LspStatus = { fg = color.grey_fg, bg = 'none' },
  St_LspStatus_Icon = { fg = color.nord_blue, bg = 'none' },
  St_EmptySpace = { fg = color.grey, bg = color.lightbg },
  St_EmptySpace2 = { fg = color.grey, bg = statusline_bg },
  St_location = { fg = color.grey_fg, bg = 'none', bold = true },
  St_spaces = { fg = color.grey_fg, bg = 'none' },
  St_encoding = { fg = color.grey_fg, bg = 'none' },
  St_fileformat = { fg = color.grey_fg, bg = 'none' },
  St_filesize = { fg = color.grey_fg, bg = 'none' },
  St_interpreter = { fg = color.grey_fg, bg = 'none' },
}

-- add common lsp highlights
M.default = merge_tb('force', M.default, Lsp_highlights)

local function genModes_hl(modename, col)
  M.default['St_' .. modename .. 'Mode'] = { bg = 'none', fg = color[col] }
  M.default['St_' .. modename .. 'ModeSep'] =
    { fg = color[col], bg = color.grey }
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
