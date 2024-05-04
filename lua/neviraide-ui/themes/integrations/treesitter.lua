local color = require('neviraide-ui.themes.colors').palette
-- local generate_color = require('neviraide-ui.themes.color').change_hex_lightness

-- local magenta = generate_color(color.magenta, vim.o.bg == 'dark' and 0 or -20)
-- color.pink = generate_color(color.pink, vim.o.bg == 'dark' and 10 or 0)

return {
  ['@error'] = { fg = color.bright_red },
  ['@punctuation.delimiter'] = { fg = color.foreground },
  ['@punctuation.bracket'] = { fg = color.foreground },
  ['@markup.list'] = { fg = color.cyan },

  ['@constant'] = { fg = color.magenta },
  ['@constant.builtin'] = { fg = color.magenta },
  ['@markup.link.label.symbol'] = { fg = color.magenta },

  ['@constant.macro'] = { fg = color.cyan },
  ['@string.regexp'] = { fg = color.red },
  ['@string.escape'] = { fg = color.cyan },
  ['@string.special.symbol'] = { fg = color.magenta },
  ['@character'] = { fg = color.green },
  ['@number'] = { fg = color.magenta },
  ['@boolean'] = { fg = color.magenta },
  ['@number.float'] = { fg = color.green },
  ['@annotation'] = { fg = color.yellow },
  ['@attribute'] = { fg = color.cyan },
  ['@module'] = { fg = color.orange },

  ['@function.builtin'] = { fg = color.cyan },
  ['@function'] = { fg = color.green },
  ['@function.macro'] = { fg = color.green },
  ['@variable.parameter'] = { fg = color.orange },
  ['@variable.parameter.reference'] = { fg = color.orange },
  ['@function.method'] = { fg = color.green },
  ['@variable.member'] = { fg = color.orange },
  ['@property'] = { fg = color.magenta },
  ['@constructor'] = { fg = color.cyan },

  ['@keyword.conditional'] = { fg = color.pink },
  ['@keyword.repeat'] = { fg = color.pink },
  ['@label'] = { fg = color.cyan },

  ['@keyword'] = { fg = color.pink },
  ['@keyword.function'] = { fg = color.cyan },
  ['@keyword.function.ruby'] = { fg = color.pink },
  ['@keyword.operator'] = { fg = color.pink },
  ['@operator'] = { fg = color.pink },
  ['@keyword.exception'] = { fg = color.magenta },
  ['@type'] = { fg = color.blue },
  ['@type.builtin'] = { fg = color.cyan, italic = true },
  ['@type.qualifier'] = { fg = color.pink },
  ['@structure'] = { fg = color.magenta },
  ['@keyword.include'] = { fg = color.pink },

  ['@variable'] = { fg = color.foreground },
  ['@variable.builtin'] = { fg = color.magenta },

  ['@markup'] = { fg = color.orange },
  ['@markup.strong'] = { fg = color.orange, bold = true }, -- bold
  ['@markup.emphasis'] = { fg = color.yellow, italic = true }, -- italic
  ['@markup.underline'] = { fg = color.orange },
  ['@markup.heading'] = { fg = color.pink, bold = true }, -- title
  ['@markup.raw'] = { fg = color.yellow }, -- inline code
  ['@markup.link.url'] = { fg = color.yellow, italic = true }, -- urls
  ['@markup.link'] = { fg = color.orange, bold = true },

  ['@tag'] = { fg = color.cyan },
  ['@tag.attribute'] = { fg = color.green },
  ['@tag.delimiter'] = { fg = color.cyan },

  -- Semantic
  ['@class'] = { fg = color.cyan },
  ['@struct'] = { fg = color.cyan },
  ['@enum'] = { fg = color.cyan },
  ['@enumMember'] = { fg = color.magenta },
  ['@event'] = { fg = color.cyan },
  ['@interface'] = { fg = color.cyan },
  ['@modifier'] = { fg = color.cyan },
  ['@regexp'] = { fg = color.yellow },
  ['@typeParameter'] = { fg = color.cyan },
  ['@decorator'] = { fg = color.cyan },

  ------------------
  ['@variable.member.key'] = { fg = color.pink },

  ['@module.builtin'] = { fg = color.pink },

  ['@string'] = { fg = vim.o.bg == 'dark' and color.green or '#000000' },
  ['@string.regex'] = { fg = color.cyan },
  -- ["@character.special"] = { fg = color.pink },

  ['@keyword.return'] = { fg = color.magenta, italic = true },
  ['@keyword.import'] = { link = 'Include' },
  ['@keyword.conditional.ternary'] = { fg = color.magenta, italic = true },
  ['@keyword.storage'] = { fg = color.bright_yellow },
  ['@keyword.directive.define'] = { fg = color.magenta },
  ['@keyword.directive'] = { fg = color.bright_yellow },

  ['@function.call'] = { fg = color.blue },
  ['@function.method.call'] = { fg = color.blue },

  ['@reference'] = { fg = color.white },
  ['@symbol'] = { fg = color.green },
  ['@text'] = { fg = color.white },
  ['@text.emphasis'] = { fg = color.yellow },
  ['@text.strike'] = { fg = color.red, strikethrough = true },
  ['@definition'] = { sp = color.grey, underline = true },
  ['@scope'] = { bold = true },

  -- markup
  ['@markup.link.label'] = { fg = color.cyan },
  ['@markup.italic'] = { italic = true },
  ['@markup.strikethrough'] = { strikethrough = true },
  ['@markup.quote'] = { bg = color.black },

  ['@comment'] = { fg = color.grey },
  ['@comment.todo'] = { fg = color.grey, bg = color.white },
  ['@comment.warning'] = { fg = color.black, bg = color.yellow },
  ['@comment.note'] = { fg = color.black, bg = color.white },
  ['@comment.danger'] = { fg = color.black, bg = color.red },

  ['@diff.plus'] = { fg = color.green },
  ['@diff.minus'] = { fg = color.red },
  ['@diff.delta'] = { fg = color.grey },
}
