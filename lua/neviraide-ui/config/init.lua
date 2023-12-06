local require = require('neviraide-ui.utils.lazy')

local Routes = require('neviraide-ui.config.routes')

local M = {}

M.ns = vim.api.nvim_create_namespace('neviraide-ui')

function M.defaults()
  ---@class NeviraideUIConfig
  local defaults = {

    cmdline = {
      enabled = true, -- enables the NeviraideUI cmdline UI
      view = 'cmdline_popup', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      opts = {}, -- global options for the cmdline. See section on views
      ---@type table<string, CmdlineFormat>
      format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        -- title: set to anything or empty string to hide
        cmdline = { pattern = '^:', icon = '', lang = 'vim' },
        search_down = {
          kind = 'search',
          pattern = '^/',
          icon = ' ',
          lang = 'regex',
        },
        search_up = {
          kind = 'search',
          pattern = '^%?',
          icon = ' ',
          lang = 'regex',
        },
        filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
        lua = {
          pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' },
          icon = '',
          lang = 'lua',
        },
        help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
        calculator = { pattern = '^=', icon = '', lang = 'vimnormal' },
        input = {}, -- Used by input()
        -- lua = false, -- to disable a format, set to `false`
      },
    },
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.

      -- BUG: disabling ui
      enabled = false, -- enables the NeviraideUI messages UI
      view = 'notify', -- default view for messages
      view_error = 'notify', -- view for errors
      view_warn = 'notify', -- view for warnings
      view_history = 'messages', -- view for :messages
      view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
    },
    popupmenu = {
      enabled = true, -- enables the NeviraideUI popupmenu UI
      ---@type 'nui'|'cmp'
      backend = 'nui', -- backend to use to show regular cmdline completions
      ---@type NeviraideUIPopupmenuItemKind|false
      -- Icons for completion item kinds (see defaults at neviraide-ui.config.icons.kinds)
      kind_icons = {}, -- set to `false` to disable icons
    },
    -- default options for require('neviraide-ui').redirect
    -- see the section on Command Redirection
    ---@type NeviraideUIRouteConfig
    redirect = {
      view = 'popup',
      filter = { event = 'msg_show' },
    },
    -- You can add any custom commands below that will be available with `:NeviraideUI command`
    ---@type table<string, NeviraideUICommand>
    commands = {
      history = {
        -- options for the message history that you get with `:NeviraideUI`
        view = 'split',
        opts = { enter = true, format = 'details' },
        filter = {
          any = {
            { event = 'notify' },
            { error = true },
            { warning = true },
            { event = 'msg_show', kind = { '' } },
            { event = 'lsp', kind = 'message' },
          },
        },
      },
      -- :NeviraideUI last
      last = {
        view = 'popup',
        opts = { enter = true, format = 'details' },
        filter = {
          any = {
            { event = 'notify' },
            { error = true },
            { warning = true },
            { event = 'msg_show', kind = { '' } },
            { event = 'lsp', kind = 'message' },
          },
        },
        filter_opts = { count = 1 },
      },
      -- :NeviraideUI errors
      errors = {
        -- options for the message history that you get with `:NeviraideUI`
        view = 'popup',
        opts = { enter = true, format = 'details' },
        filter = { error = true },
        filter_opts = { reverse = true },
      },
    },
    notify = {
      -- NeviraideUI can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using NeviraideUI for this is the routing and consistent history view
      enabled = true,
      view = 'notify',
    },
    lsp = {
      -- progress = {
      --   enabled = false,
      --   -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      --   -- See the section on formatting for more details on how to customize.
      --   --- @type NeviraideUIFormat|string
      --   format = 'lsp_progress',
      --   --- @type NeviraideUIFormat|string
      --   format_done = 'lsp_progress_done',
      --   throttle = 1000 / 30, -- frequency to update lsp progress message
      --   view = 'mini',
      -- },
      override = {
        -- override the default lsp markdown formatter with NeviraideUI
        ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
        -- override the lsp markdown formatter with NeviraideUI
        ['vim.lsp.util.stylize_markdown'] = false,
        -- override cmp documentation with NeviraideUI (needs the other options to work)
        ['cmp.entry.get_documentation'] = false,
      },
      hover = {
        enabled = true,
        silent = false, -- set to true to not show a message if hover is not available
        view = nil, -- when nil, use defaults from documentation
        ---@type NeviraideUIViewOptions
        opts = {}, -- merged with defaults from documentation
      },
      signature = {
        enabled = false,
        auto_open = {
          enabled = true,
          trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
          luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
          throttle = 50, -- Debounce lsp signature help request by 50ms
        },
        view = nil, -- when nil, use defaults from documentation
        ---@type NeviraideUIViewOptions
        opts = {}, -- merged with defaults from documentation
      },
      message = {
        -- Messages shown by lsp servers
        enabled = true,
        view = 'notify',
        opts = {},
      },
      -- defaults for hover and signature help
      documentation = {
        view = 'hover',
        ---@type NeviraideUIViewOptions
        opts = {
          replace = true,
          render = 'plain',
          format = { '{message}' },
          win_options = { concealcursor = 'n', conceallevel = 3 },
        },
      },
    },
    markdown = {
      hover = {
        ['|(%S-)|'] = vim.cmd.help, -- vim help links
        ['%[.-%]%((%S-)%)'] = require('neviraide-ui.utils').open, -- markdown links
      },
      highlights = {
        ['|%S-|'] = '@text.reference',
        ['@%S+'] = '@parameter',
        ['^%s*(Parameters:)'] = '@text.title',
        ['^%s*(Return:)'] = '@text.title',
        ['^%s*(See also:)'] = '@text.title',
        ['{%S-}'] = '@parameter',
      },
    },
    health = {
      checker = false, -- Disable if you don't want health checks to run
    },
    smart_move = {
      -- neviraide-ui tries to move out of the way of existing floating windows.
      enabled = true, -- you can disable this behaviour here
      -- add any filetypes here, that shouldn't trigger smart move.
      excluded_filetypes = { 'cmp_menu', 'cmp_docs', 'notify' },
    },
    ---@type NeviraideUIPresets
    presets = {
      -- you can enable a preset by setting it to true, or a table that will override the preset config
      -- you can also add custom presets that you can enable/disable with enabled=true
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
      cmdline_output_to_split = false, -- send the output of a command you executed in the cmdline to a split
    },
    throttle = 1000 / 30, -- how frequently does NeviraideUI need to check for ui updates? This has no effect when in blocking mode.
    ---@type NeviraideUIConfigViews
    views = {}, ---@see section on views
    ---@type NeviraideUIRouteConfig[]
    routes = {}, --- @see section on routes
    ---@type table<string, NeviraideUIFilter>
    status = {}, --- @see section on statusline components
    ---@type NeviraideUIFormatOptions
    format = {}, --- @see section on formatting
    debug = false,
    log = vim.fn.stdpath('state') .. '/neviraide-ui.log',
    log_max_size = 1024 * 1024 * 2, -- 10MB
  }
  return defaults
end

--- @type NeviraideUIConfig
M.options = {}

M._running = false
function M.is_running() return M._running end

function M.setup(options)
  options = options or {}

  M.fix_legacy(options)

  if options.popupmenu and options.popupmenu.kind_icons == true then
    options.popupmenu.kind_icons = nil
  end

  M.options = vim.tbl_deep_extend('force', {}, M.defaults(), {
    views = require('neviraide-ui.config.views').defaults,
    status = require('neviraide-ui.config.status').defaults,
    format = require('neviraide-ui.config.format').defaults,
    popupmenu = {
      kind_icons = require('neviraide-ui.config.icons').kinds,
    },
  })

  M.truncate_log()

  require('neviraide-ui.config.preset').setup(options)

  local routes = M.options.routes
  M.options = vim.tbl_deep_extend('force', M.options, options)
  vim.list_extend(M.options.routes, routes)

  if M.options.popupmenu.kind_icons == false then
    M.options.popupmenu.kind_icons = {}
  end

  require('neviraide-ui.config.cmdline').setup()

  M.options.routes = Routes.get(M.options.routes)

  require('neviraide-ui.config.highlights').setup()
  vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function() require('neviraide-ui.config.highlights').setup() end,
  })

  require('neviraide-ui.lsp').setup()
  M._running = true
end

function M.truncate_log()
  local stat = vim.loop.fs_stat(M.options.log)
  if stat and stat.size > M.options.log_max_size then
    io.open(M.options.log, 'w+'):close()
  end
end

---@param opts NeviraideUIConfig
function M.fix_legacy(opts)
  if
    opts.lsp
    and opts.lsp.signature
    and type(opts.lsp.signature.auto_open) == 'boolean'
  then
    opts.lsp.signature.auto_open = {
      enabled = opts.lsp.signature.auto_open,
    }
  end
  -- if opts.lsp_progress then
  --   opts.lsp = opts.lsp or {}
  --   opts.lsp.progress = opts.lsp_progress
  --   opts.lsp_progress = nil
  -- end
  if opts.history then
    opts.commands = opts.commands or {}
    opts.commands.history = opts.history
    opts.history = nil
  end
end

return M
