dofile(vim.g.neviraide_themes_cache .. 'buftabline')

local autocmd = require('neviraide.utils').autocmd

-- store listed buffers in tab local var
vim.t.bufs = vim.api.nvim_list_bufs()

local listed_bufs = {}

for _, val in ipairs(vim.t.bufs) do
  if vim.bo[val].buflisted then table.insert(listed_bufs, val) end
end

vim.t.bufs = listed_bufs

-- autocmds for tabufline -> store bufnrs on bufadd, bufenter events
-- thx to https://github.com/ii14 & stores buffer per tab -> table
autocmd('NEVIRAIDE_newbuftab', { 'BufAdd', 'BufEnter', 'tabnew' }, {
  callback = function(args)
    local bufs = vim.t.bufs

    if vim.t.bufs == nil then
      vim.t.bufs = vim.api.nvim_get_current_buf() == args.buf and {}
        or { args.buf }
    else
      -- check for duplicates
      if
        not vim.tbl_contains(bufs, args.buf)
        and (args.event == 'BufEnter' or vim.bo[args.buf].buflisted or args.buf ~= vim.api.nvim_get_current_buf())
        and vim.api.nvim_buf_is_valid(args.buf)
        and vim.bo[args.buf].buflisted
      then
        table.insert(bufs, args.buf)
        vim.t.bufs = bufs
      end
    end

    -- remove unnamed buffer which isnt current buf & modified
    if args.event == 'BufAdd' then
      local first_buf = vim.t.bufs[1]

      if
        #vim.api.nvim_buf_get_name(first_buf) == 0
        and not vim.api.nvim_get_option_value('modified', { buf = first_buf })
      then
        table.remove(bufs, 1)
        vim.t.bufs = bufs
      end
    end
  end,
})

autocmd('NEVIRAIDE_bufdel', 'BufDelete', {
  callback = function(args)
    for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
      local bufs = vim.t[tab].bufs
      if bufs then
        for i, bufnr in ipairs(bufs) do
          if bufnr == args.buf then
            table.remove(bufs, i)
            vim.t[tab].bufs = bufs
            break
          end
        end
      end
    end
  end,
})

autocmd(
  'NEVIRAIDE_buftabline',
  { 'BufNew', 'BufNewFile', 'BufRead', 'TabEnter', 'TermOpen' },
  {
    pattern = '*',
    callback = function()
      if
        #vim.fn.getbufinfo({ buflisted = 1 }) >= 2
        or #vim.api.nvim_list_tabpages() >= 2
      then
        vim.opt.showtabline = 2
        vim.opt.tabline = "%!v:lua.require('neviraide-ui.buftabline.modules')()"
        vim.api.nvim_del_augroup_by_name('NEVIRAIDE_buftabline')
      end
    end,
  }
)
