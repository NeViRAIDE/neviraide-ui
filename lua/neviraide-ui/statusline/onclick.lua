vim.cmd('function! OpenLspInfo(a,b,c,d) \n LspInfo \n endfunction')
vim.cmd(
  'function! OpenDiagnosticWorkspace(a,b,c,d) \n Telescope diagnostics severity_bound=ERROR \n endfunction'
)

vim.cmd(
  'function! OpenGitStatus(a,b,c,d) \n Neotree position=right git_status toggle \n endfunction'
)
vim.cmd('function! OpenDiff(a,b,c,d) \n DiffviewOpen \n endfunction')

vim.cmd('function! UpdatePlugins(a,b,c,d) \n Lazy update \n endfunction')

vim.cmd(
  'function! ShowTodoList(a,b,c,d) \n TodoTelescope theme=ivy initial_mode=normal previewer=false layout_config={bottom_pane={height=15}} \n endfunction'
)

vim.cmd(
  "function! SetIndents(a,b,c,d) \n lua require('neviraide-ui.utils.change_settings.indents').setIndents() \n endfunction"
)
