local autocmd = require('neviraide.utils').autocmd

autocmd('NEVIRAIDE_lspprog', 'User', {
  pattern = 'LspProgressUpdate',
  callback = function() vim.cmd('redrawstatus') end,
})

-- FIX: set darker bg for help
autocmd('NeviraideHelpDarkerBG', 'FileType', {
  pattern = 'help',
  callback = function()
    local current_win = vim.api.nvim_get_current_win()
    vim.api.nvim_set_option_value(
      'winhighlight',
      'Normal:NeviraideHelpDarkerBG',
      { win = current_win }
    )
  end,
})

-- FIX: not change bg when out from darker window (help) - change to buf from win
autocmd('NeviraideTerminalDarkerBG', 'TermOpen', {
  pattern = '*',
  callback = function()
    local current_win = vim.api.nvim_get_current_win()
    vim.api.nvim_set_option_value(
      'winbar',
      '%#NeviraideTerminalWinbar#',
      { win = current_win }
    )
    vim.api.nvim_set_option_value(
      'winhighlight',
      'Normal:NeviraideTerminalDarkerBG',
      { win = current_win }
    )
  end,
})
