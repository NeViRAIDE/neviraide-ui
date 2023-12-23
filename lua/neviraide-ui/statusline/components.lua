---@alias StatusLineComponent fun(condition?: boolean):string

-- TODO: add on click event for all components
-- TODO: add run code component
-- FIX: for checkhealth filetype

local M = {}

local i = require('neviraide-ui.icons.utils').icon
local utils = require('neviraide-ui.utils')

local icons_colors = {
  ['n'] = { i('NORMAL', 'vim-normal-mode', 0, 1), 'St_NormalMode' },
  ['no'] = {
    i('NORMAL', 'vim-normal-mode', 0, 1) .. ' (no)',
    'St_NormalMode',
  },
  ['nov'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' (nov)', 'Directory' },
  ['noV'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' (noV)', 'Directory' },
  ['noCTRL-V'] = { i('NORMAL', 'vim-normal-mode', 0, 1), 'Directory' },
  ['niI'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' i', 'Directory' },
  ['niR'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' r', 'Directory' },
  ['niV'] = { i('NORMAL', 'vim-normal-mode', 0, 1) .. ' v', 'Directory' },
  ['nt'] = {
    i('NORMAL', 'vim-normal-mode', 0, 1)
      .. '-'
      .. i('TERMINAL', 'vim-terminal-mode', 0, 1),
    'St_NTerminalMode',
  },
  ['ntT'] = {
    i('NORMAL', 'vim-normal-mode', 0, 1)
      .. '-'
      .. i('TERMINAL', 'vim-terminal-mode', 0, 1)
      .. ' (ntT)',
    'St_NTerminalMode',
  },

  ['v'] = { i('VISUAL', 'vim-visual-mode', 0, 1), 'St_VisualMode' },
  ['vs'] = {
    i('VISUAL', 'vim-visual-mode', 0, 1) .. '-CHAR (Ctrl O)',
    'St_VisualMode',
  },
  ['V'] = {
    i('VISUAL', 'vim-visual-mode', 0, 1) .. '-LINE',
    'St_VisualMode',
  },
  ['Vs'] = {
    i('VISUAL', 'vim-visual-mode', 0, 1) .. '-LINE',
    'St_VisualMode',
  },
  [''] = {
    i('VISUAL', 'vim-visual-mode', 0, 1) .. '-BLOCK',
    'St_VisualMode',
  },

  ['i'] = { i('INSERT', 'vim-insert-mode', 0, 1), 'St_InsertMode' },
  ['ic'] = {
    i('INSERT', 'vim-insert-mode', 0, 1) .. ' (completion)',
    'St_InsertMode',
  },
  ['ix'] = {
    i('INSERT', 'vim-insert-mode', 0, 1) .. ' completion',
    'St_InsertMode',
  },

  ['t'] = { i('TERMINAL', 'vim-terminal-mode', 0, 1), 'St_TerminalMode' },

  ['R'] = { i('REPLACE', 'vim-replace-mode', 0, 1), 'St_ReplaceMode' },
  ['Rc'] = {
    i('REPLACE', 'vim-replace-mode', 0, 1) .. ' (Rc)',
    'St_ReplaceModeSubstitute',
  },
  ['Rx'] = {
    i('REPLACE', 'vim-replace-mode', 0, 1) .. 'a (Rx)',
    'St_ReplaceMode',
  },
  ['Rv'] = {
    i('INSERT', 'vim-insert-mode', 0, 1) .. '- ',
    'St_ReplaceMode',
  },
  ['Rvc'] = {
    i('INSERT', 'vim-insert-mode', 0, 1) .. '-  (Rvc)',
    'St_ReplaceMode',
  },
  ['Rvx'] = {
    i('INSERT', 'vim-insert-mode', 0, 1) .. '-  (Rvx)',
    'St_ReplaceMode',
  },

  ['s'] = { i('SELECT', 'vim-select-mode', 0, 1), 'St_SelectMode' },
  ['S'] = {
    i('SELECT', 'vim-select-mode', 0, 1) .. '-LINE',
    'St_SelectMode',
  },
  [''] = {
    i('SELECT', 'vim-select-mode', 0, 1) .. '-BLOCK',
    'St_SelectMode',
  },

  ['c'] = { i('COMMAND', 'vim-command-mode', 0, 1), 'St_CommandMode' },
  ['cv'] = { i('COMMAND', 'vim-command-mode', 0, 1), 'St_CommandMode' },
  ['ce'] = { i('COMMAND', 'vim-command-mode', 0, 1), 'St_CommandMode' },
  ['r'] = { 'PROMPT', 'St_ConfirmMode' },
  ['rm'] = { 'MORE', 'St_ConfirmMode' },
  ['r?'] = { 'CONFIRM', 'St_ConfirmMode' },
  ['x'] = { 'CONFIRM', 'St_ConfirmMode' },
  ['!'] = {
    i('TERMINAL', 'vim-terminal-mode', 0, 1),
    'St_TerminalMode',
  },
}

---@param separator string
---@param size integer
---@param condition? boolean
---@return string
M.separator = function(separator, size, condition)
  local m = vim.api.nvim_get_mode().mode
  if condition then
    return string.rep(
      ' ',
      size,
      '%#' .. icons_colors[m][2] .. '#' .. separator .. '%#Comment#'
    )
  end
  return ''
end

---@type StatusLineComponent
M.indent = function() return '%#Comment#%=' end

---@type StatusLineComponent
M.mode = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = '%#'
    .. icons_colors[m][2]
    .. '#'
    .. icons_colors[m][1]
    .. '%#Comment#'
  return current_mode
end

---Filetype with version of the interpreter.
---@type StatusLineComponent
M.interpreter = function(condition)
  local highlight = 'St_interpreter'
  -- local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local buf_number = vim.api.nvim_get_current_buf()
  local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = buf_number })

  -- PERF: check all for better speed
  if buf_ft == 'lua' then
    return '%#' .. highlight .. '#' .. i('', 'lua', 0, 2) .. _VERSION
  -- elseif buf_ft == 'rust' then
  --   local rust_version = vim.fn.execute(':!rustc -V')
  --   return '%#'
  --     .. highlight
  --     .. '#'
  --     .. i('', 'rust', 0, 2)
  --     .. 'Rust '
  --     .. rust_version:match('%d[^ ]*')
  elseif buf_ft == 'go' then
    local go_version = vim.fn.execute(':!go version')
    return '%#'
      .. highlight
      .. '#'
      .. i('', 'go', 0, 2)
      .. 'Go '
      .. go_version:match('%d[^ ]*')
  elseif buf_ft == 'python' then
    local python_version = vim.fn.system('python -V')
    python_version = python_version:match('%d+%.%d+%.%d+')
    return '%#'
      .. highlight
      .. '#'
      .. i('', 'python', 0, 2)
      .. 'Python '
      .. python_version
  end
  -- TODO: add icons for interpreter
  return utils.capitalizeFirstLetter(buf_ft)
end

---@type StatusLineComponent
M.LSP_status = function()
  if rawget(vim, 'lsp') then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if
        client.attached_buffers[vim.api.nvim_get_current_buf()]
        and client.name ~= 'null-ls'
      then
        local long = '%#St_LspStatus#'
          .. i('', 'server', 1, 2)
          .. client.name
        local short = '%#St_LspStatus#' .. i('', 'server', 1, 2) .. 'LSP'
        return (vim.o.columns > 100 and long) or short
      end
    end
  end
  return '%#Comment#'
end

---@type StatusLineComponent
M.LSP_Diagnostics = function()
  if not rawget(vim, 'lsp') then return '%#Comment#' end

  local errors =
    #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings =
    #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints =
    #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info =
    #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local err = (errors and errors > 0)
      and ('%#St_lspError#' .. i('', 'x-circle', 0, 1) .. errors .. ' ')
    or ''
  local war = (warnings and warnings > 0)
      and ('%#St_lspWarning#' .. i('', 'alert', 0, 1) .. warnings .. ' ')
    or ''
  local hin = (hints and hints > 0)
      and ('%#St_LspHints#' .. i('', 'light-bulb', 0, 1) .. hints)
    or ''
  local inf = (info and info > 0)
      and ('%#St_LspInfo#' .. i('', 'info', 0, 1) .. info .. ' ')
    or ''

  if err ~= '' or war ~= '' or inf ~= '' or hin ~= '' then
    return M.separator('|', 2, true) .. err .. war .. inf .. hin
  else
    return ''
  end
end

---@type StatusLineComponent
M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then return '' end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0)
      and (i('', 'diff-added', 1, 1) .. git_status.added)
    or ''
  local changed = (git_status.changed and git_status.changed ~= 0)
      and (i('', 'diff-modified', 1, 1) .. git_status.changed)
    or ''
  local removed = (git_status.removed and git_status.removed ~= 0)
      and (i('', 'diff-removed', 1, 1) .. git_status.removed)
    or ''
  local branch_name = i('', 'git-branch', 0, 1) .. git_status.head .. ' '

  if added ~= '' or changed ~= '' or removed ~= '' then
    return '%#DiffAdded#'
      .. added
      .. '%#DiffModified#'
      .. changed
      .. '%#DiffRemoved#'
      .. removed
      .. M.separator('|', 2, true)
      .. '%#gitcommitBranch#'
      .. branch_name
      .. '%#Comment#'
  else
    return '%#gitcommitBranch#' .. branch_name .. '%#Comment#'
  end
end

---@type StatusLineComponent
M.location = function()
  local lines = vim.api.nvim_buf_line_count(0)
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  if
    c <= 1
    or vim.bo.filetype == 'neviraideDashboard'
    or vim.bo.filetype == 'TelescopePrompt'
  then
    return '%#St_Location#' .. i('Ln', 'rows', 1, 2) .. r .. '/' .. lines
  end
  return '%#St_Location#'
    .. i('Col', 'columns', 0, 2)
    .. c
    .. ','
    .. i('Ln', 'rows', 1, 2)
    .. r
    .. '/'
    .. lines
end

---@type StatusLineComponent
M.filesize = function(condition)
  local file = tostring(vim.fn.expand('%:p'))
  if file == nil or #file == 0 then return '' end
  local size = vim.fn.getfsize(file)
  if size <= 0 then return '' end

  local suffixes = { 'b', 'k', 'm', 'g' }

  local i = 1
  while size > 1024 and i < #suffixes do
    size = size / 1024
    i = i + 1
  end

  local format = i == 1 and '%d%s' or '%.1f%s'
  if condition then
    return '%#St_filesize#' .. string.format(format, size, suffixes[i])
  end
  return ''
end

---@type StatusLineComponent
M.fileformat = function(condition)
  local symbols = {
    unix = 'LF ',
    dos = 'CRLF ',
    mac = 'CR ',
  }
  if condition then return '%#St_fileformat#' .. symbols[vim.bo.fileformat] end
  return ''
end

---@type StatusLineComponent
M.encoding = function(condition)
  -- FIX: emty on .txt
  if condition then
    return '%#St_encoding#' .. string.upper(vim.opt.fileencoding:get())
  end
  return ''
end

---@type StatusLineComponent
M.spaces = function(condition)
  if condition then return '%#St_spaces#' .. vim.o.tabstop .. ' spaces' end
  return ''
end

---@type StatusLineComponent
M.lazy = function()
  local ok, lazy = pcall(require, 'lazy.status')
  if ok then
    local count = lazy.updates()
    if count ~= false then
      for _, client in ipairs(vim.lsp.get_clients()) do
        if
          client.attached_buffers[vim.api.nvim_get_current_buf()]
          and client.name ~= 'null-ls'
        then
          return M.separator('|', 2, true) .. '%#Boolean#' .. count
        end
      end
      return ' %#Boolean#' .. count
    end
  end
  return ''
end

return M
