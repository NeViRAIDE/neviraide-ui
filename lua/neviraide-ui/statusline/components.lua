local M = {}

local icons = require('neviraide-ui.icons.mappings')

---@param name string
---@return string
local function icon(name) return vim.fn.nr2char(icons[name]) .. ' ' end

local icons_colors = {
  ['n'] = { icon('vim-normal-mode'), 'St_NormalMode' },
  ['no'] = { icon('vim-normal-mode') .. ' (no)', 'St_NormalMode' },
  ['nov'] = { icon('vim-normal-mode') .. ' (nov)', 'Directory' },
  ['noV'] = { icon('vim-normal-mode') .. ' (noV)', 'Directory' },
  ['noCTRL-V'] = { icon('vim-normal-mode'), 'Directory' },
  ['niI'] = { icon('vim-normal-mode') .. ' i', 'Directory' },
  ['niR'] = { icon('vim-normal-mode') .. ' r', 'Directory' },
  ['niV'] = { icon('vim-normal-mode') .. ' v', 'Directory' },
  ['nt'] = {
    icon('vim-normal-mode') .. '-' .. icon('vim-terminal-mode'),
    'St_NTerminalMode',
  },
  ['ntT'] = {
    icon('vim-normal-mode') .. '-' .. icon('vim-terminal-mode') .. ' (ntT)',
    'St_NTerminalMode',
  },

  ['v'] = { icon('vim-visual-mode'), 'Statement' },
  ['vs'] = { icon('vim-visual-mode') .. '-CHAR (Ctrl O)', 'Statement' },
  ['V'] = { icon('vim-visual-mode') .. '-LINE', 'Statement' },
  ['Vs'] = { icon('vim-visual-mode') .. '-LINE', 'Statement' },
  [''] = { icon('vim-visual-mode') .. '-BLOCK', 'Statement' },

  ['i'] = { icon('vim-insert-mode'), 'String' },
  ['ic'] = { icon('vim-insert-mode') .. ' (completion)', 'String' },
  ['ix'] = { icon('vim-insert-mode') .. ' completion', 'String' },

  ['t'] = { icon('vim-terminal-mode'), 'WarningMsg' },

  ['R'] = { icon('vim-replace-mode'), 'Substitute' },
  ['Rc'] = { icon('vim-replace-mode') .. ' (Rc)', 'Substitute' },
  ['Rx'] = { icon('vim-replace-mode') .. 'a (Rx)', 'Substitute' },
  ['Rv'] = { icon('vim-insert-mode') .. '- ', 'Substitute' },
  ['Rvc'] = { icon('vim-insert-mode') .. '-  (Rvc)', 'Substitute' },
  ['Rvx'] = { icon('vim-insert-mode') .. '-  (Rvx)', 'Substitute' },

  ['s'] = { icon('vim-select-mode'), 'Substitute' },
  ['S'] = { icon('vim-select-mode') .. '-LINE', 'Substitute' },
  [''] = { icon('vim-select-mode') .. '-BLOCK', 'Substitute' },
  ['c'] = { icon('vim-command-mode'), 'WarningMsg' },
  ['cv'] = { icon('vim-command-mode'), 'WarningMsg' },
  ['ce'] = { icon('vim-command-mode'), 'WarningMsg' },
  ['r'] = { 'PROMPT', 'St_ConfirmMode' },
  ['rm'] = { 'MORE', 'St_ConfirmMode' },
  ['r?'] = { 'CONFIRM', 'St_ConfirmMode' },
  ['x'] = { 'CONFIRM', 'St_ConfirmMode' },
  ['!'] = { icon('vim-terminal-mode'), 'WarningMsg' },
}

---@param separator string
---@param size integer
---@return string
M.separator = function(separator, size)
  local m = vim.api.nvim_get_mode().mode
  return string.rep(
    ' ',
    size,
    '%#' .. icons_colors[m][2] .. '#' .. separator .. '%#Comment#'
  )
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
        local long = '%#St_LspStatus# ' .. icon('server') .. ' ' .. client.name
        local short = ' ' .. icon('server') .. ' LSP'
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
      and ('%#DiagnosticError#' .. ' ' .. errors .. ' ')
    or ''
  local war = (warnings and warnings > 0)
      and ('%#DiagnosticWarn#' .. ' ' .. warnings .. ' ')
    or ''
  local hin = (hints and hints > 0)
      and ('%#DiagnosticHint#' .. '󰌵 ' .. hints)
    or ''
  local inf = (info and info > 0)
      and ('%#DiagnosticInfo#' .. ' ' .. info .. ' ')
    or ''

  if err ~= '' or war ~= '' or inf ~= '' or hin ~= '' then
    return M.separator('|', 2) .. err .. war .. inf .. hin
  else
    return ''
  end
end

---@return string
M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then return '' end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0)
      and (' ' .. icon('diff-added') .. git_status.added)
    or ''
  local changed = (git_status.changed and git_status.changed ~= 0)
      and (' ' .. icon('diff-modified') .. git_status.changed)
    or ''
  local removed = (git_status.removed and git_status.removed ~= 0)
      and (' ' .. icon('diff-removed') .. git_status.removed)
    or ''
  local branch_name = icon('git-branch') .. git_status.head .. ' '

  if added ~= '' or changed ~= '' or removed ~= '' then
    return '%#GitSignsAdd#'
      .. added
      .. '%#GitSignsChange#'
      .. changed
      .. '%#GitSignsDelete#'
      .. removed
      .. M.separator('|', 2)
      .. '%#Character#'
      .. branch_name
      .. '%#Comment#'
  else
    return '%#NeogitBranch#' .. branch_name .. '%#Comment#'
  end
end

---@return string
M.location = function()
  local lines = vim.api.nvim_buf_line_count(0)
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  return '%#Comment# ' .. c .. ':' .. r .. '/' .. lines
end

---@return string
M.filesize = function()
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
  return '%#Comment#' .. string.format(format, size, suffixes[i])
end

---@return string
M.fileformat = function()
  local symbols = {
    unix = 'LF ',
    dos = 'CRLF ',
    mac = 'CR ',
  }
  return '%#Comment#' .. symbols[vim.bo.fileformat]
end

---@return string
M.encoding = function()
  return '%#Comment#' .. string.upper(vim.opt.fileencoding:get())
end

---@return string
M.spaces = function() return '%#Comment#' .. vim.o.tabstop .. ' spaces' end

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
          return M.separator('|', 2) .. '%#Boolean#' .. count
        end
      end
      return ' %#Boolean#' .. count
    end
  end
  return ''
end

return M
