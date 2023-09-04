local api = vim.api

vim.opt.statusline = '%!v:lua.require("neviraide-ui.statusline").run()'

require('neviraide-ui.buftabline.lazyload')
require('usercommands')

vim.defer_fn(function()
  local bufs = api.nvim_list_bufs()

  if #vim.fn.argv() == 0 and (#bufs == 1 and bufs[1] == 1) then
    require('neviraide-ui.dashboard').open()
    api.nvim_exec2(':bd#', { output = true })
  end
end, 0)

require('autocommands')

require('neviraide-ui.override_vim_ui.input')
require('neviraide-ui.override_vim_ui.select')
