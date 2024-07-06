local M = {}

M.startTimer = function()
  local Input = require('nui.input')
  local event = require('nui.utils.autocmd').event
  local utils = require('neviraide-ui.vimUI.utils')

  local text = {
    top = ' Set timer ',
    top_align = 'center',
  }

  local input = Input({
    position = { row = '5%', col = '95%' },
    size = { width = 20 },
    border = utils.nui_border(text),
    win_options = utils.popup_bg(),
    relative = 'editor',
    buf_options = {
      filetype = 'timer',
    },
  }, {
    prompt = '',
    default_value = '',
    on_submit = function(value) vim.fn.execute('TimerStart ' .. value) end,
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
