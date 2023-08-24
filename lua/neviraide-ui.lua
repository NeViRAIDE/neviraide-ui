local new_cmd = vim.api.nvim_create_user_command
local config = NEVIRAIDE()

vim.opt.statusline =
  '%!v:lua.require("neviraide-ui.statusline.statusline").run()'

if config.buftabline_enabled then
  require('neviraide-ui.buftabline.lazyload')
end

local highlight = require('neviraide.utils').hi

highlight('NeviraideDashboardAscii', { link = 'DashboardHeader' })
highlight('NeviraideDashboardButtons', { link = 'DashboardCenter' })
highlight('NeviraideDashboardVimver', { link = 'Comment' })

vim.api.nvim_create_autocmd('Colorscheme', {
  pattern = '*',
  callback = function()
    highlight('NeviraideDashboardAscii', { link = 'DashboardHeader' })
    highlight('NeviraideDashboardButtons', { link = 'DashboardCenter' })
    highlight('NeviraideDashboardVimver', { link = 'Comment' })
  end,
})
new_cmd('Dashboard', function()
  if vim.g.nvdash_displayed then
    require('neviraide-ui.buftabline.buftabline').close_buffer()
  else
    require('neviraide-dashboard').open()
  end
end, {})

-- if config.dashboard_on_startup then
vim.defer_fn(function()
  local bufs = vim.api.nvim_list_bufs()

  if #vim.fn.argv() == 0 and (#bufs == 1 and bufs[1] == 1) then
    require('neviraide-ui.dashboard.dashboard').open()
    vim.api.nvim_exec(':bd#', true)
  end
end, 0)
-- end

-- redraw dashboard on VimResized event
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    if vim.bo.filetype == 'neviraideDashboard' then
      vim.opt_local.modifiable = true
      vim.api.nvim_buf_set_lines(0, 0, -1, false, { '' })
      require('neviraide-ui.dashboard.dashboard').open()
    end
  end,
})

-- redraw statusline on LspProgressUpdate event & fixes #145
vim.api.nvim_create_autocmd('User', {
  pattern = 'LspProgressUpdate',
  callback = function() vim.cmd('redrawstatus') end,
})
