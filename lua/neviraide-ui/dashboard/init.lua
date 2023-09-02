local autocmd = require('neviraide.utils').autocmd
local M = {}
local api = vim.api
local fn = vim.fn
local icon = require('neviraide-ui.icons.utils').icon

dofile(vim.g.neviraide_themes_cache .. 'dashboard')

local raw_height = 1
local pointer = icon('', 'dot-fill', 0, 1)

local buttons = require('neviraide-ui.dashboard.buttons')
local headerAscii = require('neviraide-ui.dashboard.ascii')

local emmptyLine = string.rep(' ', vim.fn.strwidth(headerAscii[1]))

table.insert(headerAscii, 1, emmptyLine)
table.insert(headerAscii, 2, emmptyLine)

headerAscii[#headerAscii + 1] = emmptyLine
headerAscii[#headerAscii + 1] = emmptyLine

autocmd('NEVIRAIDE_dashbufleave', 'BufLeave', {
  callback = function()
    if vim.bo.ft == 'neviraide_dashboard' then
      vim.g.neviraide_dashboard_displayed = false
    end
  end,
})

local neviraideDashboardWidth = #headerAscii[8] + 4

local max_height = #headerAscii + 4 + (2 * #buttons) -- 4  = extra spaces i.e top/bottom
local get_win_height = api.nvim_win_get_height

local function nvim_version()
  local nvim_full_version_info = vim.fn.execute('version')
  if nvim_full_version_info:match('NVIM') then
    return nvim_full_version_info:match('NVIM [^\n]*')
  else
    return 'Check your configuration'
  end
end

M.open = function()
  vim.g.nv_previous_buf = vim.api.nvim_get_current_buf()

  local buf = vim.api.nvim_create_buf(false, true)
  local win = api.nvim_get_current_win()

  -- FIX: invalid column out of range if small current window

  -- switch to larger win if cur win is small
  if neviraideDashboardWidth + 6 > api.nvim_win_get_width(0) then
    vim.api.nvim_set_current_win(api.nvim_list_wins()[2])
    win = api.nvim_get_current_win()
  end

  api.nvim_win_set_buf(win, buf)

  vim.opt_local.filetype = 'neviraideDashboard'
  vim.g.neviraide_dashboard_displayed = true

  local header = headerAscii

  local function addSpacing_toBtns(txt1, txt2)
    local btn_len = fn.strwidth(txt1) + fn.strwidth(txt2)
    local spacing = 24 - btn_len
    return txt1 .. string.rep(' ', spacing - 1) .. txt2 .. ' '
  end

  local function addPadding_toHeader(str)
    local pad = (api.nvim_win_get_width(win) - fn.strwidth(str)) / 2
    return string.rep(' ', math.floor(pad)) .. str .. ' '
  end

  local dashboard = {}

  for _, val in ipairs(header) do
    table.insert(dashboard, val)
  end

  for _, val in ipairs(buttons) do
    table.insert(dashboard, addSpacing_toBtns(pointer .. val[1], val[2]) .. ' ')
    for i = 1, raw_height - 1 do
      table.insert(dashboard, header[1] .. ' ')
    end
  end

  table.insert(dashboard, '')
  table.insert(dashboard, '')
  table.insert(dashboard, '')
  table.insert(dashboard, nvim_version())

  local result = {}

  -- make all lines available
  for i = 1, math.max(get_win_height(win), max_height) do
    result[i] = ''
  end

  local headerStart_Index = math.abs(
    math.floor((get_win_height(win) / 2) - (#dashboard / 2))
  ) + 1 -- 1 = To handle zero case
  local abc = math.abs(math.floor((get_win_height(win) / 2) - (#dashboard / 2)))
    + 1 -- 1 = To handle zero case

  -- set ascii
  for _, val in ipairs(dashboard) do
    result[headerStart_Index] = addPadding_toHeader(val)
    headerStart_Index = headerStart_Index + 1
  end

  api.nvim_buf_set_lines(buf, 0, -1, false, result)

  local neviraideDashboard = api.nvim_create_namespace('neviraideDashboard')
  local horiz_pad_index = math.floor(
    (api.nvim_win_get_width(win) / 2) - (neviraideDashboardWidth / 2)
  ) - 3

  for i = abc, abc + #header - 2 do
    api.nvim_buf_add_highlight(
      buf,
      neviraideDashboard,
      'NeviraideDashboardAscii',
      i,
      horiz_pad_index,
      -1
    )
  end

  for i = abc + #header - 1, abc + #dashboard do
    api.nvim_buf_add_highlight(
      buf,
      neviraideDashboard,
      'NeviraideDashboardButtons',
      i,
      horiz_pad_index,
      -1
    )
  end

  for i = abc + #dashboard - 2, abc + #dashboard do
    api.nvim_buf_add_highlight(
      buf,
      neviraideDashboard,
      'NeviraideDashboardVimver',
      i,
      horiz_pad_index,
      -1
    )
  end

  api.nvim_win_set_cursor(
    win,
    { abc + #header, math.floor(vim.o.columns / 2) - 12 }
  )

  local first_btn_line = abc + #header + raw_height
  local keybind_lineNrs = {}

  for _, _ in ipairs(buttons) do
    table.insert(keybind_lineNrs, first_btn_line - raw_height)
    first_btn_line = first_btn_line + raw_height
  end

  vim.keymap.set('n', 'h', '', { buffer = true })
  vim.keymap.set('n', '<Left>', '', { buffer = true })
  vim.keymap.set('n', 'l', '', { buffer = true })
  vim.keymap.set('n', '<Right>', '', { buffer = true })
  vim.keymap.set('n', '<Up>', '', { buffer = true })
  vim.keymap.set('n', '<Down>', '', { buffer = true })

  vim.keymap.set('n', 'k', function()
    local cur = fn.line('.')
    local target_line = cur == keybind_lineNrs[1]
        and keybind_lineNrs[#keybind_lineNrs]
      or cur - raw_height
    api.nvim_win_set_cursor(
      win,
      { target_line, math.floor(vim.o.columns / 2) - 12 }
    )
  end, { buffer = true })

  vim.keymap.set('n', 'j', function()
    local cur = fn.line('.')
    local target_line = cur == keybind_lineNrs[#keybind_lineNrs]
        and keybind_lineNrs[1]
      or cur + raw_height
    api.nvim_win_set_cursor(
      win,
      { target_line, math.floor(vim.o.columns / 2) - 12 }
    )
  end, { buffer = true })

  -- pressing enter on
  vim.keymap.set('n', '<CR>', function()
    for i, val in ipairs(keybind_lineNrs) do
      if val == fn.line('.') then
        local action = buttons[i][3]

        if type(action) == 'string' then
          vim.cmd(action)
        elseif type(action) == 'function' then
          action()
        end
      end
    end
  end, { buffer = true })

  -- buf only options
  vim.opt_local.bufhidden = 'wipe'
  vim.opt_local.buflisted = false
  vim.opt_local.matchpairs = ''
  vim.opt_local.swapfile = false
  vim.opt_local.buftype = 'nofile'
  vim.opt_local.synmaxcol = 0
  vim.opt_local.wrap = false
  vim.opt_local.foldlevel = 999
  vim.opt_local.foldcolumn = '0'
  vim.opt_local.cursorcolumn = false
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.list = false
  vim.opt_local.spell = false
  vim.opt_local.signcolumn = 'no'
  vim.opt_local.modifiable = false

  vim.opt_local.colorcolumn = ''
  vim.opt_local.colorcolumn = '0'
end

return M
