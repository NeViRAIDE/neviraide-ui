local color = require('neviraide-ui.themes.colors').palette

return {
  -- LSP Semantic (0.9+)
  ['@lsp.type.class'] = { fg = color.cyan },
  ['@lsp.type.enum'] = { fg = color.cyan },
  ['@lsp.type.decorator'] = { fg = color.green },
  ['@lsp.type.enumMember'] = { fg = color.magenta },
  ['@lsp.type.function'] = { fg = color.green },
  ['@lsp.type.interface'] = { fg = color.cyan },
  ['@lsp.type.macro'] = { fg = color.cyan },
  ['@lsp.type.method'] = { fg = color.green },
  ['@lsp.type.namespace'] = { fg = color.orange },
  ['@lsp.type.parameter'] = { fg = color.orange },
  ['@lsp.type.property'] = { fg = color.magenta },
  ['@lsp.type.struct'] = { fg = color.cyan },
  ['@lsp.type.type'] = { fg = color.nord_blue },
  ['@lsp.type.variable'] = { fg = color.foreground },
  ['@event'] = { fg = color.pink },
  ['@modifier'] = { fg = color.pink },
  ['@regexp'] = { fg = color.red },
}
