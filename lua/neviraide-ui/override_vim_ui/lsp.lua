local require = require('neviraide-ui.utils.lazy')
local Markdown = require('neviraide-ui.text.markdown')

local Config = require('neviraide-ui.config')
local Format = require('neviraide-ui.lsp.format')
local Message = require('neviraide-ui.message')
local Hacks = require('neviraide-ui.utils.hacks')

local M = {}

function M.setup()
  Hacks.on_module('cmp.entry', function(mod)
    mod.get_documentation = function(self)
      local item = self:get_completion_item()

      local lines = item.documentation
          and Format.format_markdown(item.documentation)
        or {}
      local ret = table.concat(lines, '\n')
      local detail = item.detail
      if detail and type(detail) == 'table' then
        detail = table.concat(detail, '\n')
      end

      if detail and not ret:find(detail, 1, true) then
        local ft = self.context.filetype
        local dot_index = string.find(ft, '%.')
        if dot_index ~= nil then ft = string.sub(ft, 0, dot_index - 1) end
        ret = ('```%s\n%s\n```\n%s'):format(ft, vim.trim(detail), ret)
      end
      return vim.split(ret, '\n')
    end
  end)

  vim.lsp.util.convert_input_to_markdown_lines = function(input, contents)
    contents = contents or {}
    local ret = Format.format_markdown(input)
    vim.list_extend(contents, ret)
    return contents
  end

  vim.lsp.util.stylize_markdown = function(buf, contents, _opts)
    vim.api.nvim_buf_clear_namespace(buf, Config.ns, 0, -1)
    local text = table.concat(contents, '\n')
    local message = Message('lsp')
    Markdown.format(message, text)
    message:render(buf, Config.ns)
    Markdown.keys(buf)
    return vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  end
end

return M
