-- FIX: working only 1 time
local layout = require('neviraide-ui.settings_nui.layout')
local popups = require('neviraide-ui.settings_nui.popups')
local tree = require('neviraide-ui.settings_nui.tree')
local mappings = require('neviraide-ui.settings_nui.mappings')

layout:mount()

tree():render()

mappings()

for _, popup in pairs(popups) do
  popup:on('BufLeave', function()
    popups.main:unmount()
    popups.tree:unmount()
    popup:unmount()
    layout:unmount()
  end, { once = true })
end
