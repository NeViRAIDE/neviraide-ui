local map_options = { noremap = true, nowait = true }

return function(popups, tree)
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

  popups.tree:map('n', 'q', function() popups.tree:unmount() end, map_options)

  for _, popup in pairs(popups) do
    popup:on('BufLeave', function()
      popups.main:unmount()
      popup:unmount()
    end, { once = true })
  end
  popups.tree:map('n', 'q', function() popups.tree:unmount() end, map_options)

  popups.tree:map('n', '<CR>', function()
    local node = tree:get_node()
    print(tostring(node.text))
  end, map_options)

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
end
