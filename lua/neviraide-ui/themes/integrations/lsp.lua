local colors = require('neviraide-ui.themes').get_theme_tb('base_30')
local theme = require('neviraide-ui.themes').get_theme_tb('base_16')

return {
  -- LSP References
  LspReferenceText = { bg = theme.base01, bold = true },
  LspReferenceRead = { bg = theme.base01, bold = true },
  LspReferenceWrite = { bg = theme.base01, bold = true, underline = true },

  -- Lsp Diagnostics
  DiagnosticHint = { fg = colors.purple },
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInformation = { fg = colors.green },
  LspSignatureActiveParameter = { fg = colors.black, bg = colors.green },

  LspCodeLens = { fg = 'Grey' },
  LspCodeLensSeparator = { link = 'Boolean' },

  RenamerTitle = { fg = colors.black, bg = colors.red },
  RenamerBorder = { fg = colors.red },
}
