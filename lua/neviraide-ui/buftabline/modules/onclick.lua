vim.cmd(
  "function! TbGoToBuf(bufnr,b,c,d) \n execute 'b'..a:bufnr \n endfunction"
)

vim.cmd([[
   function! TbKillBuf(bufnr,b,c,d) 
        call luaeval('require("neviraide-ui.buftabline.buftabline").close_buffer(_A)', a:bufnr)
  endfunction]])

vim.cmd('function! TbNewTab(a,b,c,d) \n tabnew \n endfunction')
vim.cmd(
  "function! TbGotoTab(tabnr,b,c,d) \n execute a:tabnr ..'tabnext' \n endfunction"
)
vim.cmd(
  "function! TbTabClose(a,b,c,d) \n lua require('neviraide-ui.buftabline.buftabline').closeAllBufs('closeTab') \n endfunction"
)
vim.cmd(
  "function! TbCloseAllBufs(a,b,c,d) \n lua require('neviraide-ui.buftabline.buftabline').closeAllBufs() \n endfunction"
)
vim.cmd(
  "function! TbToggle_theme(a,b,c,d) \n lua require('base46').toggle_theme() \n endfunction"
)
vim.cmd(
  'function! TbToggleTabs(a,b,c,d) \n let g:TbTabsToggled = !g:TbTabsToggled | redrawtabline \n endfunction'
)
