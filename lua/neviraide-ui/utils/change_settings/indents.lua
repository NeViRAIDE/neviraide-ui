local M = {}

M.setIndents = function()
  local Input = require('nui.input')
  local event = require('nui.utils.autocmd').event
  local utils = require('neviraide-ui.vimUI.utils')

  local text = {
    top = ' Set indents ',
    top_align = 'center',
  }

  local input = Input({
    position = { row = '90%', col = '50%' },
    size = { width = 15 },
    border = utils.nui_border(text),
    win_options = utils.popup_bg(),
    relative = 'editor',
    buf_options = {
      filetype = 'indents',
    },
  }, {
    prompt = '',
    default_value = '',
    on_submit = function(size)
      vim.o.shiftwidth = tonumber(size)
      vim.o.tabstop = tonumber(size)
      vim.o.softtabstop = tonumber(size)

      local old = 'indents = ' .. NEVIRAIDE().ui.indents
      local new = 'indents = ' .. size

      require('neviraide-ui.utils').replace_word(old, new)

      require('plenary.reload').reload_module('NEVIRAIDE')
    end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:map(
    'n',
    { '<Esc>', 'q', '<C-c>' },
    function() input:unmount() end,
    { noremap = true, nowait = true }
  )
  input:map(
    'i',
    { '<Esc>', '<C-q>', '<C-c>' },
    function() input:unmount() end,
    { noremap = true, nowait = true }
  )
  input:mount()
end

return M
