local require = require('neviraide-ui.utils.lazy')

local Config = require('neviraide-ui.config')

local M = {}

---@alias LspEvent "lsp"
M.event = 'lsp'

---@enum LspKind
M.kinds = {
  progress = 'progress',
  hover = 'hover',
  message = 'message',
  signature = 'signature',
}

function M.setup()
  if Config.options.lsp.hover.enabled then
    require('neviraide-ui.lsp.hover').setup()
  end

  if Config.options.lsp.signature.enabled then
    require('neviraide-ui.lsp.signature').setup()
  end

  if Config.options.lsp.message.enabled then
    require('neviraide-ui.lsp.message').setup()
  end

  -- if Config.options.lsp.progress.enabled then
  --   require('neviraide-ui.lsp.progress').setup()
  -- end

  local overrides = vim.tbl_filter(
    ---@param v boolean
    function(v) return v end,
    Config.options.lsp.override
  )

  if #overrides > 0 then require('neviraide-ui.override_vim_ui.lsp').setup() end
end

function M.scroll(delta) return require('neviraide-ui.lsp.docs').scroll(delta) end

function M.hover()
  ---@diagnostic disable-next-line: missing-parameter
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(
    0,
    'textDocument/hover',
    params,
    require('neviraide-ui.lsp.hover').on_hover
  )
end

function M.signature()
  ---@diagnostic disable-next-line: missing-parameter
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(
    0,
    'textDocument/signatureHelp',
    params,
    require('neviraide-ui.lsp.signature').on_signature
  )
end

return M
