local api = vim.api
local usrcmd = api.nvim_create_user_command
local util = require('neviraide-ui.utils')

local ui_options = {
  'borders',
  'cursor_column',
  'cursor_line',
  'icons',
  'indents',
  'numbers',
  'relative_numbers',
  'transparency',
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
    require('neviraide.utils.reload_config').reload_transparency()
  elseif opts.fargs[1] == 'theme' then
    require('neviraide-ui.utils.change_theme').change_theme(opts.fargs[2])
    -- FIX: not changing buftabline icons on refresh
    require('neviraide.utils.reload_config').reload_config()
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
      elseif current_arg == 'cursor_column' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'numbers' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'relative_numbers' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'transparency' then
        return { 'toggle', 'enable', 'disable' }
      elseif current_arg == 'indents' then
        return {}
      elseif current_arg == 'icons' then
        return { 'nonicons', 'devicons' }
      elseif current_arg == 'theme' then
        local themes = {}
        for _, theme in pairs(util.dirLookup()) do
          theme = theme:gsub('./', '')
          table.insert(themes, theme)
        end
        table.sort(themes)
        return themes
      else
        if require('neviraide-ui.config').options.hyprTheme then
          return ui_options
        end
        table.insert(ui_options, 'theme')
        return ui_options
      end
    end
  end,
})
