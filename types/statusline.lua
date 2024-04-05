---@alias StatusLineComponent fun(condition?: boolean):string Module component for NeviraideStatusLine.
---@alias StatusLineSeparator fun(symbol: string, size: integer, condition?: boolean):string Symbol which separate StatusLineComponents.

---@class StatusLineUtils<table>
---@field ignored fun():boolean Hide component if filetype in the list.
---@field buffer_not_empty fun():boolean Hide component if buffer is empty.
---@field hide_in_width fun(size?: integer):boolean Hide component if window width less than <size> columns.
---@field mode_color table<string, table<string, string>> Colors for Neovim Mode.

---@class NeviraideStatusLine<table>
---@field encoding? StatusLineComponent File encoding.
---@field fileformat? StatusLineComponent File format.
---@field filesize? StatusLineComponent File size.
---@field git? StatusLineComponent Count of added, changed and removed diffs for current buffer and current git branch.
---@field indent? StatusLineComponent Space between modules sections.
---@field interpreter? StatusLineComponent Filetype with version of the interpreter.
---@field lazy? StatusLineComponent Count of available updates for NEOVIM plugins by |lazy.nvim|.
---@field location? StatusLineComponent Current cursor position in file.
---@field LSP_status? StatusLineComponent Active LSP client for current buffer.
---@field LSP_Diagnostics? StatusLineComponent Count of errors, warnings, info and hints for current buffer.
---@field mode? StatusLineComponent Neovim mode with icon and highlighting.
---@field spaces? StatusLineComponent Number of spaces for indent.
---@field todos? StatusLineComponent Number of todos in current workspace.
