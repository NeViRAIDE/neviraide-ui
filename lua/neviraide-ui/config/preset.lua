local require = require('neviraide-ui.utils.lazy')

local Util = require('neviraide-ui.utils')
local Config = require('neviraide-ui.config')

local border = NEVIRAIDE().border

---@class NeviraideUIPreset: NeviraideUIConfig
---@field enabled? boolean

local M = {}

function M.setup(options)
  for name, preset in pairs(options.presets or {}) do
    if preset ~= false then M.load(name, preset) end
  end
end

---@param name string
---@param preset NeviraideUIConfig|boolean
function M.load(name, preset)
  if preset == true and not M.presets[name] then
    return Util.panic('Unknown preset ' .. name)
  end

  preset = vim.tbl_deep_extend(
    'force',
    {},
    M.presets[name] or {},
    type(preset) == 'table' and preset or {}
  )
  ---@cast preset NeviraideUIPreset

  if preset.enabled == false then return end

  local routes = preset.routes
  preset.routes = nil
  Config.options = vim.tbl_deep_extend('force', Config.options, preset)
  if routes then vim.list_extend(Config.options.routes, routes) end
end

---@class NeviraideUIPresets: table<string, NeviraideUIPreset|boolean>
M.presets = {
  bottom_search = {
    cmdline = {
      format = {
        search_down = {
          view = 'cmdline',
        },
        search_up = {
          view = 'cmdline',
        },
      },
    },
  },
  lsp_doc_border = {
    views = {
      hover = {
        border = {
          style = border,
        },
        position = { row = 2, col = 2 },
      },
    },
  },
  command_palette = {
    views = {
      cmdline_popup = {
        position = {
          row = 3,
          col = '50%',
        },
        size = {
          min_width = 60,
          width = 'auto',
          height = 'auto',
        },
      },
      cmdline_popupmenu = {
        relative = 'editor',
        position = {
          row = 6,
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
          max_height = 15,
        },
        border = {
          style = border,
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = {
            Normal = 'Normal',
            FloatBorder = 'NeviraideUICmdlinePopupBorder',
          },
        },
      },
    },
  },
  long_message_to_split = {
    routes = {
      {
        filter = { event = 'msg_show', min_height = 20 },
        view = 'cmdline_output',
      },
    },
  },
  inc_rename = {
    cmdline = {
      format = {
        IncRename = {
          pattern = '^:%s*IncRename%s+',
          icon = ' ',
          conceal = true,
          opts = {
            relative = 'cursor',
            size = { min_width = 20 },
            position = { row = -3, col = 0 },
          },
        },
      },
    },
  },
  cmdline_output_to_split = {
    routes = {
      {
        view = 'cmdline_output',
        filter = { cmdline = '^:' },
      },
    },
  },
}

return M
