-- TODO: do config for ui or not
local api = vim.api
local M = {}

M.config = {
  hyprTheme = true,
}

---Setup configuration
---@param config table
function M.setup(config)
  M.config = vim.tbl_deep_extend('force', M.config, config or {})
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
end

return M
