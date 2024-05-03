local M = {}

local function make_active_inactive(
  style_function_active,
  style_function_inactive
)
  return {
    active = style_function_active,
    inactive = style_function_inactive,
  }
end

local styles = {
  fade = make_active_inactive(
    function(name, close_btn)
      return '%#TbSepFade3#█'
        .. '%#TbSepFade2#█'
        .. '%#TbSepFade1#█'
        .. '%#TbLineBufOn#'
        .. name
        .. close_btn
        .. '%#TbSepFade1#█'
        .. '%#TbSepFade2#█'
        .. '%#TbSepFade3#█'
    end,
    function(name, close_btn) return '%#TbLineBufOff#' .. name .. close_btn end
  ),
  slant = make_active_inactive(
    function(name, close_btn)
      return '%#TbSepSlant#'
        .. '%#TbLineBufOn#'
        .. name
        .. close_btn
        .. '%#TbSepSlant#'
    end,
    function(name, close_btn) return '%#TbLineBufOff#' .. name .. close_btn end
  ),
  separator = make_active_inactive(
    function(name, close_btn)
      return '%#TbLineBufOn#' .. name .. '%#TbSeparator#|' .. close_btn
    end,
    function(name, close_btn)
      return '%#TbLineBufOff#' .. name .. '%#TbSeparator#|' .. close_btn
    end
  ),
  powerline = make_active_inactive(
    function(name, close_btn)
      return '%#TbPowerLine#' .. name .. close_btn .. '%#TbPowerLineSep#❯'
    end,
    function(name, close_btn)
      return '%#TbLineBufOff#' .. name .. close_btn .. '%#TbPowerLineSep#❯'
    end
  ),
}

M.style = function(style, name, close_btn)
  local style_set = styles[style]
  return style_set.active(name, close_btn), style_set.inactive(name, close_btn)
end

return M
