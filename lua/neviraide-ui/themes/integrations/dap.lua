local color = require('neviraide-ui.themes.colors').palette

return {
  -- Dap
  DapBreakpoint = { fg = color.red },
  DapBreakpointCondition = { fg = color.yellow },
  DapLogPoint = { fg = color.cyan },
  DapStopped = { fg = color.baby_pink },

  -- DapUI
  DAPUIScope = { fg = color.cyan },
  DAPUIType = { fg = color.dark_purple },
  DAPUIValue = { fg = color.cyan },
  DAPUIVariable = { fg = color.white },
  DapUIModifiedValue = { fg = color.orange },
  DapUIDecoration = { fg = color.cyan },
  DapUIThread = { fg = color.green },
  DapUIStoppedThread = { fg = color.cyan },
  DapUISource = { fg = color.lavender },
  DapUILineNumber = { fg = color.cyan },
  DapUIFloatBorder = { fg = color.cyan },

  DapUIWatchesEmpty = { fg = color.baby_pink },
  DapUIWatchesValue = { fg = color.green },
  DapUIWatchesError = { fg = color.baby_pink },

  DapUIBreakpointsPath = { fg = color.cyan },
  DapUIBreakpointsInfo = { fg = color.green },
  DapUIBreakPointsCurrentLine = { fg = color.green, bold = true },
  DapUIBreakpointsDisabledLine = { fg = color.grey_fg2 },

  DapUIStepOver = { fg = color.blue },
  DapUIStepOverNC = { fg = color.blue },
  DapUIStepInto = { fg = color.blue },
  DapUIStepIntoNC = { fg = color.blue },
  DapUIStepBack = { fg = color.blue },
  DapUIStepBackNC = { fg = color.blue },
  DapUIStepOut = { fg = color.blue },
  DapUIStepOutNC = { fg = color.blue },
  DapUIStop = { fg = color.red },
  DapUIStopNC = { fg = color.red },
  DapUIPlayPause = { fg = color.green },
  DapUIPlayPauseNC = { fg = color.green },
  DapUIRestart = { fg = color.green },
  DapUIRestartNC = { fg = color.green },
  DapUIUnavailable = { fg = color.grey_fg },
  DapUIUnavailableNC = { fg = color.grey_fg },
}
