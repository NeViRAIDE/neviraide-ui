local api = vim.api
local autocmd = require('neviraide.utils').autocmd

vim.opt.statusline = '%!v:lua.require("neviraide-ui.statusline").run()'

require('neviraide-ui.buftabline.lazyload')

local highlight = require('neviraide.utils').hi

api.nvim_create_user_command('Dashboard', function()
  if vim.g.nvdash_displayed then
    require('neviraide-ui.buftabline').close_buffer()
  else
    require('neviraide-ui.dashboard').open()
  end
end, {})

vim.defer_fn(function()
  local bufs = api.nvim_list_bufs()

  if #vim.fn.argv() == 0 and (#bufs == 1 and bufs[1] == 1) then
    require('neviraide-ui.dashboard').open()
    api.nvim_exec2(':bd#', { output = true })
  end
end, 0)

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

require('neviraide-ui.override_vim_ui.input')
require('neviraide-ui.override_vim_ui.select')
