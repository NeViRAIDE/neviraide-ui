local require = require('neviraide-ui.utils.lazy')

local Format = require('neviraide-ui.lsp.format')
local Util = require('neviraide-ui.utils')

local Docs = require('neviraide-ui.lsp.docs')

local Config = require('neviraide-ui.config')

local M = {}

function M.setup() vim.lsp.handlers['textDocument/hover'] = M.on_hover end

function M.on_hover(_, result, ctx)
  if not (result and result.contents) then
    if Config.options.lsp.hover.silent ~= true then
      vim.notify('No information available')
    end
    return
  end

  local message = Docs.get('hover')

  if not message:focus() then
    Format.format(message, result.contents, { ft = vim.bo[ctx.bufnr].filetype })
    if message:is_empty() then
      if Config.options.lsp.hover.silent ~= true then
        vim.notify('No information available')
      end
      return
    end
    Docs.show(message)
  end
end
M.on_hover = Util.protect(M.on_hover)

return M
