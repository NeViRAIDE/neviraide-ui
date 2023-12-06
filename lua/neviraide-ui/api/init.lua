local require = require('neviraide-ui.utils.lazy')

local Cmdline = require('neviraide-ui.ui.cmdline')
local Status = require('neviraide-ui.api.status')

local M = {}

M.status = Status

---@deprecated
M.statusline = Status

---@return CmdlinePosition?
function M.get_cmdline_position()
  return Cmdline.position and vim.deepcopy(Cmdline.position)
end

return M
