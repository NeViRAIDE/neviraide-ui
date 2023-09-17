local Layout = require('nui.layout')
local Popup = require('nui.popup')
local Tree = require('nui.tree')
local NuiLine = require('nui.line')

local popups = {
  main = Popup({
    border = 'single',
    position = '50%',
    size = {
      width = 80,
      height = 25,
    },
    relative = 'editor',
  }),
  tree = Popup({
    enter = true,
    border = 'rounded',
  }),
  test = Popup({
    border = 'double',
  }),
}

local function getDisplayValue(key, value)
  if key == 'theme' then
    return value or 'unknown'
  elseif key == 'borders' then
    return value or 'unknown'
  else
    return value and '✔' or '✖'
  end
end

local function formatMenuItem(label, value)
  local displayValue = getDisplayValue(label, value)
  local displayValueWidth = vim.fn.strwidth(displayValue)
  local paddingSize = 30 - #label - displayValueWidth
  local padding = string.rep(' ', paddingSize)
  return label .. padding .. displayValue
end

local function formatCategoryTitle(title)
  local totalWidth = 30
  local textWidth = vim.fn.strwidth(title)
  local paddingSize = (totalWidth - textWidth) / 2
  local padding = string.rep(' ', paddingSize)
  return padding .. title .. padding
end

local menu = {
  formatCategoryTitle('UI'),
  formatMenuItem('theme', vim.g.neviraide_theme),
  formatMenuItem('transparency', vim.g.transparency),
  formatMenuItem('numbers', vim.o.number),
  formatMenuItem('relative_numbers', vim.o.relativenumber),
  formatMenuItem('cursor_line', vim.o.cursorline),
  formatMenuItem('cursor_column', vim.o.cursorcolumn),
  formatMenuItem('indents', vim.g.indents),
  formatMenuItem('borders', vim.g.borders),
  formatMenuItem('nonicons', vim.g.nonicons),
  formatCategoryTitle('GIT'),
  formatMenuItem('gitsigns_line', vim.g.gitsigns_current_line_blame),
  formatMenuItem('gitsigns_signs', vim.g.gitsigns_signs),
  formatCategoryTitle('LSP'),
  formatMenuItem('lsp_inlay_hints', vim.g.lsp_inlay_hints),
  formatMenuItem('diagnostic_virtual_text', vim.g.diagnostic_virtual_text),
  formatMenuItem('diagnostic_signs', vim.g.diagnostic_signs),
}

local nodes = {}
for _, item in ipairs(menu) do
  table.insert(nodes, Tree.Node({ text = item }))
end

local tree = Tree({
  bufnr = popups.tree.bufnr,
  nodes = nodes,
  prepare_node = function(node)
    local line = NuiLine()
    line:append(node.text)
    return line
  end,
})

tree:render()

local layout = Layout(
  popups.main,
  Layout.Box({
    Layout.Box(popups.tree, { size = '50%', grow = 1 }),
    Layout.Box(popups.test, { size = '50%', grow = 1 }),
  }, { dir = 'row' })
)

local map_options = { noremap = true, nowait = true }

popups.tree:map('n', '<CR>', function()
  local node = tree:get_node()
  print(tostring(node.text))
end, map_options)

popups.tree:map('n', 'q', function() popups.tree:unmount() end, map_options)

for _, popup in pairs(popups) do
  popup:on('BufLeave', function()
    vim.schedule(function()
      local curr_bufnr = vim.api.nvim_get_current_buf()
      for _, p in pairs(popups) do
        if p.bufnr == curr_bufnr then return end
      end
      popups.main:unmount()
    end)
  end, { once = true })
end


-- print current node
popups.tree:map('n', '<CR>', function()
  local node = tree:get_node()
  print(tostring(node.text))
end, map_options)

-- collapse current node
popups.tree:map('n', 'h', function()
  local node = tree:get_node()

  if node:collapse() then tree:render() end
end, map_options)

-- collapse all nodes
popups.tree:map('n', 'H', function()
  local updated = false

  for _, node in pairs(tree.nodes.by_id) do
    updated = node:collapse() or updated
  end

  if updated then tree:render() end
end, map_options)

-- expand current node
popups.tree:map('n', 'l', function()
  local node = tree:get_node()

  if node:expand() then tree:render() end
end, map_options)

-- expand all nodes
popups.tree:map('n', 'L', function()
  local updated = false

  for _, node in pairs(tree.nodes.by_id) do
    updated = node:expand() or updated
  end

  if updated then tree:render() end
end, map_options)

popups.tree:map('n', 'q', function() popups.tree:unmount() end, map_options)

for _, popup in pairs(popups) do
  popup:on('BufLeave', function()
    popups.main:unmount()
    popup:unmount()
  end, { once = true })
  -- popup:on('BufLeave', function()
  --   vim.schedule(function()
  --     local curr_bufnr = vim.api.nvim_get_current_buf()
  --     for _, p in pairs(popups) do
  --       if p.bufnr == curr_bufnr then return end
  --     end
  --     popups.main:unmount()
  --   end)
  -- end)
end

-- Отображаем макет на экране
layout:mount()
