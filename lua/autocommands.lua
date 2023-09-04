local api = vim.api
local autocmd = require('neviraide.utils').autocmd

autocmd('NEVIRAIDE_dashresized', 'VimResized', {
  callback = function()
    if vim.bo.filetype == 'neviraideDashboard' then
      vim.opt_local.modifiable = true
      api.nvim_buf_set_lines(0, 0, -1, false, { '' })
      require('neviraide-ui.dashboard').open()
    end
  end,
})

autocmd('NEVIRAIDE_lspprog', 'User', {
  pattern = 'LspProgressUpdate',
  callback = function() vim.cmd('redrawstatus') end,
})
