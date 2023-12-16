local api = vim.api
local usrcmd = api.nvim_create_user_command
local util = require('neviraide-ui.utils')

local ui_options = {
  'borders',
  'icons',
  'indents',
}

usrcmd('Dashboard', function()
  if vim.g.nvdash_displayed then
    require('neviraide-ui.buftabline').close_buffer()
  else
    require('neviraide-ui.dashboard').open()
  end
end, {})

usrcmd('UI', function(opts)
  if #opts.fargs ~= 2 then
    print('This command required two arguments.')
    return
  end

  if opts.fargs[1] == 'borders' then
    require('neviraide-ui.utils.change_border.utils').set_borders(opts.fargs[2])
    require('neviraide.utils.reload_config').reload_borders()
  elseif opts.fargs[1] == 'indents' then
    util.settings('indents').set_indents(tonumber(opts.fargs[2]))
  elseif opts.fargs[1] == 'icons' then
    util.settings('icons').set_icons(opts.fargs[2])
    require('neviraide.utils.reload_config').reload_icons()
  end
end, {
  nargs = '*',
  desc = 'Neviraide UI',

  complete = function(findstart)
    if findstart == 1 then
      return vim.fn.col('.') - 1
    else
      local args = vim.fn.split(vim.fn.getcmdline(), ' ')
      local current_arg = args[2]

      if #args > 2 then
        return {}
      elseif current_arg == 'borders' then
        return { 'none', 'rounded', 'single', 'double', 'shadow', 'solid' }
      elseif current_arg == 'cursor_line' then
        return { 'toggle', 'enable', 'disable' }
      -- elseif current_arg == 'cursor_column' then
      --   return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'numbers' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'relative_numbers' then
        return { 'toggle', 'enable', 'disable' }
      -- elseif current_arg == 'transparency' then
      --   return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'indents' then
        return {}
      elseif current_arg == 'icons' then
        return { 'nonicons', 'devicons' }
      else
        return ui_options
      end
    end
  end,
})
