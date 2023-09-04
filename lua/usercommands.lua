local api = vim.api
local usrcmd = api.nvim_create_user_command
local util = require('neviraide-ui.utils')

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
  elseif opts.fargs[1] == 'numbers' then
    if opts.fargs[2] == 'toggle' then
      util.settings('numbers').toggle()
    elseif opts.fargs[2] == 'enable' then
      util.settings('numbers').enable()
    elseif opts.fargs[2] == 'disable' then
      util.settings('numbers').disable()
    end
  elseif opts.fargs[1] == 'relative_numbers' then
    if opts.fargs[2] == 'toggle' then
      util.settings('relativenumbers').toggle()
    elseif opts.fargs[2] == 'enable' then
      util.settings('relativenumbers').enable()
    elseif opts.fargs[2] == 'disable' then
      util.settings('relativenumbers').disable()
    end
  elseif opts.fargs[1] == 'cursor_line' then
    if opts.fargs[2] == 'toggle' then
      util.settings('cursorline').toggle()
    elseif opts.fargs[2] == 'enable' then
      util.settings('cursorline').enable()
    elseif opts.fargs[2] == 'disable' then
      util.settings('cursorline').disable()
    end
  elseif opts.fargs[1] == 'cursor_column' then
    if opts.fargs[2] == 'toggle' then
      util.settings('cursorcolumn').toggle()
    elseif opts.fargs[2] == 'enable' then
      util.settings('cursorcolumn').enable()
    elseif opts.fargs[2] == 'disable' then
      util.settings('cursorcolumn').disable()
    end
  elseif opts.fargs[1] == 'transparency' then
    if opts.fargs[2] == 'toggle' then
      util.settings('transparency').toggle()
    elseif opts.fargs[2] == 'enable' then
      util.settings('transparency').enable()
    elseif opts.fargs[2] == 'disable' then
      util.settings('transparency').disable()
    end
  elseif opts.fargs[1] == 'theme' then
    -- require('neviraide-ui.utils.change_border.utils').set_borders(opts.fargs[2])
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
      elseif current_arg == 'cursor_column' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'numbers' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'relative_numbers' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'transparency' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'theme' then
        local themes = {}
        for _, theme in pairs(util.dirLookup()) do
          theme = theme:gsub('./', '')
          table.insert(themes, theme)
        end
        return themes
      else
        return {
          'borders',
          'theme',
          'numbers',
          'relative_numbers',
          'cursor_line',
          'cursor_column',
            'transparency'
        }
      end
    end
  end,
})
