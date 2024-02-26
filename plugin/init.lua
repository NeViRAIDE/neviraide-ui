require('neviraide-ui').setup(require('neviraide-ui.config').options)

require('neviraide-ui.buftabline.lazyload')

vim.defer_fn(function()
  local bufs = vim.api.nvim_list_bufs()

  if #vim.fn.argv() == 0 and (#bufs == 1 and bufs[1] == 1) then
    require('neviraide-ui.dashboard').open()
    vim.api.nvim_exec2(':bd#', { output = true })
  end
end, 0)

print('loading ui')
require('neviraide-ui.override_vim_ui.input')
require('neviraide-ui.override_vim_ui.select')
print('finished ui')

require('autocommands')

require('neviraide-ui.themes').load_all_highlights()
