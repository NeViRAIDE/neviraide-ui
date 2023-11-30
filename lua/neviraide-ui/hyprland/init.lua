local M = {}

function M.update_theme_from_hypr()
  local hypr_conf_path = os.getenv('HOME') .. '/.config/hypr/themes/theme.conf'
  local neviraide_conf = vim.fn.stdpath('config') .. '/lua/' .. 'NEVIRAIDE.lua'

  local hypr_conf_file = io.open(hypr_conf_path, 'r')
  local neviraide_conf_file = io.open(neviraide_conf, 'r+')

  if hypr_conf_file ~= nil and neviraide_conf_file ~= nil then
    local hypr_conf_content = hypr_conf_file:read('*all')
    local extracted_theme = hypr_conf_content:match(
      "exec = gsettings set org.gnome.desktop.interface gtk%-theme '(%w+)'"
    )

    if extracted_theme ~= nil then
      local neviraide_conf_content = neviraide_conf_file:read('*all')
      local new_content = neviraide_conf_content:gsub(
        "theme = '%w+'",
        "theme = '" .. extracted_theme .. "'"
      )

      neviraide_conf_file:seek('set', 0)
      neviraide_conf_file:write(new_content)
    end

    hypr_conf_file:close()
    neviraide_conf_file:close()
  end
end

M.update_theme_from_hypr()
print('test123')

return M
