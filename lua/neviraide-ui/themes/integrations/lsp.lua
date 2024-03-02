local color = require('neviraide-ui.themes.colors').palette
return {
  -- LSP References
  LspReferenceText = { bg = color.black, bold = true },
  LspReferenceRead = { bg = color.black, bold = true },
  LspReferenceWrite = { bg = color.black, bold = true, underline = true },

  -- Lsp Diagnostics
  DiagnosticHint = { fg = color.purple },
  DiagnosticError = { fg = color.red },
  DiagnosticWarn = { fg = color.yellow },
  DiagnosticInfo = { fg = color.green },

  DiagnosticFloatingHint = { fg = color.purple },
  DiagnosticFloatingError = { fg = color.red },
  DiagnosticFloatingWarn = { fg = color.yellow },
  DiagnosticFloatingInfo = { fg = color.green },

  LspSignatureActiveParameter = {
    fg = color.green,
    italic = true,
    bold = true,
  },

  LspCodeLens = { fg = 'Grey' },
  LspCodeLensSeparator = { link = 'Boolean' },

  LspInlayHint = { fg = color.one_bg2, italic = true },
}
