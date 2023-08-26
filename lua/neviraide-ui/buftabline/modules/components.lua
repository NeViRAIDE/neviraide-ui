local api = vim.api
local fn = vim.fn
local utils = require('neviraide-ui.buftabline.modules.utils')
-- TODO: add time and date
local M = {}

M.NeoTreeOverlay = function()
  return '%#NeoTreeNormal#'
    .. (
      vim.g.neotree_side == 'right' and ''
      or string.rep(' ', utils.getNeoTreeWidth())
    )
end

M.bufferlist = function()
  local buffers = {} -- buffersults
  local available_space = vim.o.columns
    - utils.getNeoTreeWidth()
    - utils.getBtnsWidth()
  local current_buf = api.nvim_get_current_buf()
  local has_current = false -- have we seen current buffer yet?

  for _, bufnr in ipairs(vim.t.bufs) do
    if utils.isBufValid(bufnr) then
      if ((#buffers + 1) * 21) > available_space then
        if has_current then break end

        table.remove(buffers, 1)
      end

      has_current = (bufnr == current_buf and true) or has_current
      table.insert(buffers, utils.styleBufferTab(bufnr))
    end
  end

  vim.g.visibuffers = buffers
  return table.concat(buffers) .. '%#TblineFill#' .. '%=' -- buffers + empty space
end

vim.g.TbTabsToggled = 0

M.tablist = function()
  local result, number_of_tabs = '', fn.tabpagenr('$')

  if number_of_tabs > 1 then
    for i = 1, number_of_tabs, 1 do
      local tab_hl = ((i == fn.tabpagenr()) and '%#TbLineTabOn# ')
        or '%#TbLineTabOff# '
      result = result .. ('%' .. i .. '@TbGotoTab@' .. tab_hl .. i .. ' ')
      result = (
        i == fn.tabpagenr()
        and result .. '%#TbLineTabCloseBtn#' .. '%@TbTabClose@󰅙 %X'
      ) or result
    end

    local new_tabtn = '%#TblineTabNewBtn#' .. '%@TbNewTab@  %X'
    local tabstoggleBtn = '%@TbToggleTabs@ %#TBTabTitle# TABS %X'

    return vim.g.TbTabsToggled == 1
        and tabstoggleBtn:gsub('()', { [36] = ' ' })
      or new_tabtn .. tabstoggleBtn .. result
  end

  return ''
end

M.buttons = function()
  local toggle_themeBtn = '%@TbToggle_theme@%#TbLineThemeToggleBtn#'
    .. vim.g.toggle_theme_icon
    .. '%X'
  local CloseAllBufsBtn = '%@TbCloseAllBufs@%#TbLineCloseAllBufsBtn#'
    .. ' 󰅖 '
    .. '%X'
  return toggle_themeBtn .. CloseAllBufsBtn
end

return M
