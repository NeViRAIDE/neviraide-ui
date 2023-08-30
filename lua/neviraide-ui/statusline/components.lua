local M = {}

local icon = require('neviraide-ui.icons.utils').icon

local icons_colors = {
  ['n'] = { icon('vim-normal-mode', false, true), 'St_NormalMode' },
  ['no'] = { icon('vim-normal-mode', false, true) .. ' (no)', 'St_NormalMode' },
  ['nov'] = { icon('vim-normal-mode', false, true) .. ' (nov)', 'Directory' },
  ['noV'] = { icon('vim-normal-mode', false, true) .. ' (noV)', 'Directory' },
  ['noCTRL-V'] = { icon('vim-normal-mode', false, true), 'Directory' },
  ['niI'] = { icon('vim-normal-mode', false, true) .. ' i', 'Directory' },
  ['niR'] = { icon('vim-normal-mode', false, true) .. ' r', 'Directory' },
  ['niV'] = { icon('vim-normal-mode', false, true) .. ' v', 'Directory' },
  ['nt'] = {
    icon('vim-normal-mode', false, true)
      .. '-'
      .. icon('vim-terminal-mode', false, true),
    'St_NTerminalMode',
  },
  ['ntT'] = {
    icon('vim-normal-mode', false, true)
      .. '-'
      .. icon('vim-terminal-mode', false, true)
      .. ' (ntT)',
    'St_NTerminalMode',
  },

  ['v'] = { icon('vim-visual-mode', false, true), 'St_VisualMode' },
  ['vs'] = {
    icon('vim-visual-mode', false, true) .. '-CHAR (Ctrl O)',
    'St_VisualMode',
  },
  ['V'] = { icon('vim-visual-mode', false, true) .. '-LINE', 'St_VisualMode' },
  ['Vs'] = { icon('vim-visual-mode', false, true) .. '-LINE', 'St_VisualMode' },
  [''] = { icon('vim-visual-mode', false, true) .. '-BLOCK', 'St_VisualMode' },

  ['i'] = { icon('vim-insert-mode', false, true), 'St_InsertMode' },
  ['ic'] = {
    icon('vim-insert-mode', false, true) .. ' (completion)',
    'St_InsertMode',
  },
  ['ix'] = {
    icon('vim-insert-mode', false, true) .. ' completion',
    'St_InsertMode',
  },

  ['t'] = { icon('vim-terminal-mode', false, true), 'St_TerminalMode' },

  ['R'] = { icon('vim-replace-mode', false, true), 'St_ReplaceMode' },
  ['Rc'] = {
    icon('vim-replace-mode', false, true) .. ' (Rc)',
    'St_ReplaceModeSubstitute',
  },
  ['Rx'] = {
    icon('vim-replace-mode', false, true) .. 'a (Rx)',
    'St_ReplaceMode',
  },
  ['Rv'] = { icon('vim-insert-mode', false, true) .. '- ', 'St_ReplaceMode' },
  ['Rvc'] = {
    icon('vim-insert-mode', false, true) .. '-  (Rvc)',
    'St_ReplaceMode',
  },
  ['Rvx'] = {
    icon('vim-insert-mode', false, true) .. '-  (Rvx)',
    'St_ReplaceMode',
  },

  ['s'] = { icon('vim-select-mode', false, true), 'St_SelectMode' },
  ['S'] = { icon('vim-select-mode', false, true) .. '-LINE', 'St_SelectMode' },
  [''] = { icon('vim-select-mode', false, true) .. '-BLOCK', 'St_SelectMode' },
  ['c'] = { icon('vim-command-mode', false, true), 'St_CommandMode' },
  ['cv'] = { icon('vim-command-mode', false, true), 'St_CommandMode' },
  ['ce'] = { icon('vim-command-mode', false, true), 'St_CommandMode' },
  ['r'] = { 'PROMPT', 'St_ConfirmMode' },
  ['rm'] = { 'MORE', 'St_ConfirmMode' },
  ['r?'] = { 'CONFIRM', 'St_ConfirmMode' },
  ['x'] = { 'CONFIRM', 'St_ConfirmMode' },
  ['!'] = { icon('vim-terminal-mode', false, true), 'St_TerminalMode' },
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

---@return string
M.indent = function() return '%#Comment#%=' end

---@return string
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
---@param highlight string highlight group
---@return string
M.interpreter = function(highlight)
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  if buf_ft == 'lua' then
    return '%#' .. highlight .. '#' .. _VERSION
  elseif buf_ft == 'go' then
    local go_version = vim.fn.execute(':!go version')
    return '%#' .. highlight .. '#' .. 'Go ' .. go_version:match('%d[^ ]*')
  elseif buf_ft == 'python' then
    local python_version =
      vim.fn.execute(':python import sys; print(sys.version)')
    return '%#'
      .. highlight
      .. '#'
      .. 'Python '
      .. python_version:match('%d[^ ]*')
  end
  return '%#' .. highlight .. '#' .. buf_ft:gsub('^%l', string.upper)
end

---@return string
M.LSP_status = function()
  if rawget(vim, 'lsp') then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if
        client.attached_buffers[vim.api.nvim_get_current_buf()]
        and client.name ~= 'null-ls'
      then
        local long = '%#St_LspStatus# '
          .. icon('server', false, true)
          .. ' '
          .. client.name
        local short = ' ' .. icon('server', false, true) .. ' LSP'
        return (vim.o.columns > 100 and long) or short
      end
    end
  end
  return '%#Comment#'
end

---@return string
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
      and ('%#St_lspError#' .. ' ' .. errors .. ' ')
    or ''
  local war = (warnings and warnings > 0)
      and ('%#St_lspWarning#' .. ' ' .. warnings .. ' ')
    or ''
  local hin = (hints and hints > 0) and ('%#St_LspHints#' .. '󰌵 ' .. hints)
    or ''
  local inf = (info and info > 0) and ('%#St_LspInfo#' .. ' ' .. info .. ' ')
    or ''

  if err ~= '' or war ~= '' or inf ~= '' or hin ~= '' then
    return M.separator('|', 2, true) .. err .. war .. inf .. hin
  else
    return ''
  end
end

---@return string
M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then return '' end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0)
      and (' ' .. icon('diff-added', false, true) .. git_status.added)
    or ''
  local changed = (git_status.changed and git_status.changed ~= 0)
      and (' ' .. icon('diff-modified', false, true) .. git_status.changed)
    or ''
  local removed = (git_status.removed and git_status.removed ~= 0)
      and (' ' .. icon('diff-removed', false, true) .. git_status.removed)
    or ''
  local branch_name = icon('git-branch', false, true) .. git_status.head .. ' '

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

---@return string
M.location = function()
  local lines = vim.api.nvim_buf_line_count(0)
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  -- return '%#Comment# ' .. c .. ':' .. r .. '/' .. lines
  return '%#Comment#Col ' .. c .. ', Ln ' .. r .. '/' .. lines
end

---@param condition boolean
---@return string
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
    return '%#Comment#' .. string.format(format, size, suffixes[i])
  end
  return ''
end

---@param condition? boolean
---@return string
M.fileformat = function(condition)
  local symbols = {
    unix = 'LF ',
    dos = 'CRLF ',
    mac = 'CR ',
  }
  if condition then return '%#Comment#' .. symbols[vim.bo.fileformat] end
  return ''
end

---@param condition? boolean
---@return string
M.encoding = function(condition)
  if condition then
    return '%#Comment#' .. string.upper(vim.opt.fileencoding:get())
  end
  return ''
end

---@param condition? boolean
---@return string
M.spaces = function(condition)
  if condition then return '%#Comment#' .. vim.o.tabstop .. ' spaces' end
  return ''
end

---@return string
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
