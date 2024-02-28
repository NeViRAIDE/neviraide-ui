local Util = require('neviraide-ui.utils')

local commands = {}

local M = {}

---@type table<string, fun()>
M.commands = {}

function M.cmd(cmd)
  if M.commands[cmd] then
    M.commands[cmd]()
  else
    M.commands.history()
  end
end

function M.setup()
  M.commands = {
    dashboard = function()
      if vim.g.neviraide_dashboard_displayed then
        require('neviraide-ui.buftabline').close_buffer()
      else
        require('neviraide-ui.dashboard').open()
      end
    end,
    cursorcolumn = function() Util.settings('cursorcolumn').toggle() end,
    cursorline = function() Util.settings('cursorline').toggle() end,
    numbers = function() Util.settings('numbers').toggle() end,
    relativenumbers = function() Util.settings('relativenumbers').toggle() end,
    transparency = function()
      Util.settings('transparency').toggle()
      require('neviraide.utils.reload_config').reload_transparency()
    end,
  }

  for name, command in pairs(commands) do
    M.commands[name] = M.command(command)
  end

  vim.api.nvim_create_user_command('NeviraideUI', function(args)
    local cmd = vim.trim(args.args or '')
    M.cmd(cmd)
  end, {
    nargs = '?',
    desc = 'NeviraideUI',
    complete = function(_, line)
      if line:match('^%s*NeviraideUI %w+ ') then return {} end
      local prefix = line:match('^%s*NeviraideUI (%w*)') or ''
      return vim.tbl_filter(
        function(key) return key:find(prefix) == 1 end,
        vim.tbl_keys(M.commands)
      )
    end,
  })

  for name in pairs(M.commands) do
    local cmd = 'NeviraideUI' .. name:sub(1, 1):upper() .. name:sub(2)
    vim.api.nvim_create_user_command(
      cmd,
      function() M.cmd(name) end,
      { desc = 'NeviraideUI ' .. name }
    )
  end
end

return M
