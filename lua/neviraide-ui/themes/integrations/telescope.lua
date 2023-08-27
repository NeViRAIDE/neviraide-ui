local colors = require('neviraide-ui.themes').get_theme_tb('base_30')

---@return string
local function telescope_style()
  if NEVIRAIDE().border == 'none' or NEVIRAIDE().border == 'shadow' then
    return 'borderless'
  else
    return 'bordered'
  end
end

local hlgroups = {

  TelescopePromptPrefix = {
    fg = colors.red,
    bg = colors.black2,
  },

  TelescopeNormal = { bg = colors.darker_black },

  TelescopePreviewTitle = {
    fg = colors.black,
    bg = colors.green,
  },

  TelescopeSelection = { bg = colors.black2, fg = colors.white },
  TelescopeResultsDiffAdd = { fg = colors.green },
  TelescopeResultsDiffChange = { fg = colors.yellow },
  TelescopeResultsDiffDelete = { fg = colors.red },
}

local styles = {
  borderless = {
    TelescopeBorder = { fg = colors.darker_black, bg = colors.darker_black },
    TelescopePromptTitle = {
      fg = colors.black,
      bg = colors.red,
    },
    TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
    TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
    TelescopeResultsTitle = {
      fg = colors.darker_black,
      bg = colors.darker_black,
    },
    TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
  },

  bordered = {
    TelescopeBorder = { fg = colors.one_bg3 },
    TelescopePromptBorder = { fg = colors.one_bg3 },
    TelescopePromptTitle = {
      bg = colors.black,
      fg = colors.red,
    },
    TelescopeResultsTitle = { bg = colors.black, fg = colors.green },
    TelescopePreviewTitle = { bg = colors.black, fg = colors.blue },
    TelescopePromptPrefix = { bg = colors.red, fg = colors.black },
    TelescopeNormal = { bg = colors.black },
    TelescopePromptNormal = { bg = colors.black },
  },
}

local result = vim.tbl_deep_extend('force', hlgroups, styles[telescope_style()])

return result
