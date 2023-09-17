local Layout = require('nui.layout')
local Tree = require('nui.tree')
local NuiLine = require('nui.line')

local popups  = require('neviraide-ui.settings_nui.popups')

local layout = Layout(
  popups.main,
  Layout.Box({
    Layout.Box(popups.tree, {
      size = '50%',
      -- grow = 1,
    }),
    Layout.Box(popups.desc, {
      size = '50%',
      -- grow = 1,
    }),
  }, { dir = 'row' })
)

-- Отображаем макет на экране
layout:mount()

local menu = require('neviraide-ui.settings_nui.menu')

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

require('neviraide-ui.settings_nui.mappings')(popups, tree)
