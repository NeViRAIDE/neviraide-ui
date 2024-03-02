local color = require('neviraide-ui.themes.colors').palette

---@return string
local function style()
  if vim.g.b == 'none' or vim.g.b == 'shadow' or vim.g.b == 'solid' then
    return 'borderless'
  end
  return 'bordered'
end

local styles = {
  borderless = {
    NotifyBackground = { link = 'NormalFloat' },

    NotifyERRORBorder = { link = 'NormalFloat' },
    NotifyERRORIcon = { bg = color.red, fg = color.black },
    NotifyERRORTitle = { bg = color.red, fg = color.black },
    NotifyERRORBody = { bg = color.one_bg },

    NotifyWARNBorder = { link = 'NormalFloat' },
    NotifyWARNIcon = { bg = color.orange, fg = color.black },
    NotifyWARNTitle = { bg = color.orange, fg = color.black },
    NotifyWARNBody = { bg = color.one_bg },

    NotifyINFOBorder = { link = 'NormalFloat' },
    NotifyINFOIcon = { bg = color.green, fg = color.black },
    NotifyINFOTitle = { bg = color.green, fg = color.black },
    NotifyINFOBody = { bg = color.one_bg },

    NotifyDEBUGBorder = { link = 'NormalFloat' },
    NotifyDEBUGIcon = { bg = color.grey, fg = color.black },
    NotifyDEBUGTitle = { bg = color.grey, fg = color.black },
    NotifyDEBUGBody = { bg = color.one_bg },

    NotifyTRACEBorder = { link = 'NormalFloat' },
    NotifyTRACEIcon = { bg = color.purple, fg = color.black },
    NotifyTRACETitle = { bg = color.purple, fg = color.black },
    NotifyTRACEBody = { bg = color.one_bg },
  },

  bordered = {
    NotifyERRORBorder = { fg = color.red },
    NotifyERRORIcon = { fg = color.red },
    NotifyERRORTitle = { fg = color.red },
    NotifyERRORBody = { bg = 'none' },

    NotifyWARNBorder = { fg = color.orange },
    NotifyWARNIcon = { fg = color.orange },
    NotifyWARNTitle = { fg = color.orange },
    NotifyWARNBody = { bg = 'none' },

    NotifyINFOBorder = { fg = color.green },
    NotifyINFOIcon = { fg = color.green },
    NotifyINFOTitle = { fg = color.green },
    NotifyINFOBody = { bg = 'none' },

    NotifyDEBUGBorder = { fg = color.grey },
    NotifyDEBUGIcon = { fg = color.grey },
    NotifyDEBUGTitle = { fg = color.grey },
    NotifyDEBUGBody = { bg = 'none' },

    NotifyTRACEBorder = { fg = color.purple },
    NotifyTRACEIcon = { fg = color.purple },
    NotifyTRACETitle = { fg = color.purple },
    NotifyTRACEBody = { bg = 'none' },
  },
}

local hlgroups = {
  NotifyERRORBorder = { fg = color.red },
  NotifyERRORIcon = { fg = color.red },
  NotifyERRORTitle = { fg = color.red },

  NotifyWARNBorder = { fg = color.orange },
  NotifyWARNIcon = { fg = color.orange },
  NotifyWARNTitle = { fg = color.orange },

  NotifyINFOBorder = { fg = color.green },
  NotifyINFOIcon = { fg = color.green },
  NotifyINFOTitle = { fg = color.green },

  NotifyDEBUGBorder = { fg = color.grey },
  NotifyDEBUGIcon = { fg = color.grey },
  NotifyDEBUGTitle = { fg = color.grey },

  NotifyTRACEBorder = { fg = color.purple },
  NotifyTRACEIcon = { fg = color.purple },
  NotifyTRACETitle = { fg = color.purple },
}

local result = vim.tbl_deep_extend('force', hlgroups, styles[style()])

return result
