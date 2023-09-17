local utils = require('neviraide-ui.settings_nui.utils')

return {
  utils.formatCategoryTitle('UI'),
  utils.formatMenuItem('theme', vim.g.neviraide_theme),
  utils.formatMenuItem('transparency', vim.g.transparency),
  utils.formatMenuItem('numbers', vim.o.number),
  utils.formatMenuItem('relative_numbers', vim.o.relativenumber),
  utils.formatMenuItem('cursor_line', vim.o.cursorline),
  utils.formatMenuItem('cursor_column', vim.o.cursorcolumn),
  utils.formatMenuItem('indents', vim.g.indents),
  utils.formatMenuItem('borders', vim.g.borders),
  utils.formatMenuItem('nonicons', vim.g.nonicons),
  utils.formatCategoryTitle('GIT'),
  utils.formatMenuItem('gitsigns_line', vim.g.gitsigns_current_line_blame),
  utils.formatMenuItem('gitsigns_signs', vim.g.gitsigns_signs),
  utils.formatCategoryTitle('LSP'),
  utils.formatMenuItem('lsp_inlay_hints', vim.g.lsp_inlay_hints),
  utils.formatMenuItem('diagnostic_virtual_text', vim.g.diagnostic_virtual_text),
  utils.formatMenuItem('diagnostic_signs', vim.g.diagnostic_signs),
}
