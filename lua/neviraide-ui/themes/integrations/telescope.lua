local colors = require('neviraide-ui.themes').get_theme_tb('base_30')
local accent = require('neviraide-ui.hyprland.utils').colors

---@return string
local function telescope_style()
  if vim.g.b == 'none' or vim.g.b == 'shadow' or vim.g.b == 'solid' then
    return 'borderless'
  end
  return 'bordered'
end

local hlgroups = {

  TelescopePromptPrefix = {
    fg = colors.red,
    bg = colors.black2,
  },

  TelescopeNormal = { bg = accent.foreground },

  TelescopePreviewTitle = {
    fg = colors.black,
    bg = colors.green,
  },

  TelescopeSelection = {
    bg = accent.foreground,
    fg = colors.white,
    bold = true,
  },
  TelescopeSelectionCaret = { bg = accent.foreground, fg = colors.red },
  TelescopeResultsDiffAdd = { fg = colors.green },
  TelescopeResultsDiffChange = { fg = colors.yellow },
  TelescopeResultsDiffDelete = { fg = colors.red },
}

local styles = {
  borderless = {
    TelescopeBorder = { fg = accent.foreground, bg = accent.foreground },
    TelescopePromptTitle = {
      fg = colors.black,
      bg = colors.red,
    },
    TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
    TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
    TelescopeResultsTitle = {
      fg = accent.foreground,
      bg = accent.foreground,
    },
    TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
  },

  bordered = {
    TelescopeBorder = { link = 'FloatBorder' },
    TelescopePromptBorder = { link = 'FloatBorder' },
    TelescopePromptTitle = { bg = colors.black, fg = colors.red, bold = true },
    TelescopeResultsTitle = {
      bg = colors.black,
      fg = colors.green,
      bold = true,
    },
    TelescopePreviewTitle = {
      bg = colors.black,
      fg = colors.blue,
      bold = true,
    },
    TelescopePromptPrefix = { bg = colors.black, fg = colors.red, bold = true },
    TelescopeNormal = { bg = colors.black },
    TelescopePromptNormal = { bg = colors.black },
  },
}

local result = vim.tbl_deep_extend('force', hlgroups, styles[telescope_style()])

return result
