# User Interface for [NEVIRAIDE](https://github.com/RAprogramm/NEVIRAIDE)

Lightweight &amp; performant ui plugin for NEVIRAIDE providing the following :

- Standalone colorschemes and following hyprland themes
- Dashboard (startup screen)
- Statusline
- Buffers and tabs line
- Icons
- Settings Changer Util

## 📜 Table of Contents

1. [📦 Installation](#installation)
2. [🔧 Dependencies](#dependencies)
   - [🌟 Optional dependencies](#optional-dependencies)
3. [🔍 Overview](#overview)
4. [🚀 Usage](#usage)
   - [🖥 Dashboard Command](#dashboard-command)
   - [🛠 UI Command](#ui-command)
     - [📖 Examples](#examples)
5. [🔤 Autocompletion](#autocompletion)

## Installation

Install neviraide-ui using your favorite plugin manager. For example, with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
require('lazy').load({
    plugins = {
      {
        'RAprogramm/neviraide-ui.nvim',
        name = 'UI',
        event = 'VeryLazy',
        opts = {
          -- INFO: uncomment if you don't want to follow hyprland theme
          -- hyprTheme = false,
        },
        config = function(_, opts) require('neviraide-ui').setup(opts) end,
      },
    }
})
```

Reload your Neovim configuration or restart Neovim.

After this, neviraide-ui will be automatically downloaded, installed, and configured for you.

## Dependencies

- [plenary](https://github.com/nvim-lua/plenary.nvim)

### Optional dependencies

- #### Icons

For display [nonicons](https://github.com/yamatsum/nonicons) instead of [devicons](https://github.com/vorillaz/devicons) run in your terminal:

```sh
yay -S nonicons-git
```

add this `symbol_map U+f101-U+f25c nonicons` to your kitty config.

## Overview

The code establishes commands in Neovim to control various aspects of the neviraide-ui plugin. The commands available are:

- `Dashboard`: Toggles between displaying and hiding the dashboard.

- `UI`: A versatile command with various sub-commands to control UI settings:
  - `borders`: Sets border styles.
  - `numbers`: Toggles, enables, or disables line numbers.
  - `relative_numbers`: Toggles, enables, or disables relative line numbers.
  - `cursor_line`: Toggles, enables, or disables the cursor line.
  - `cursor_column`: Toggles, enables, or disables the cursor column.
  - `transparency`: Toggles, enables, or disables the transparency.
  - `theme`: Changes the theme.
  - `indents`: Sets the indent size.

## Usage

### Dashboard Command:

```vim
:Dashboard
```

Use this command to toggle the dashboard display on and off.

### UI Command:

```vim
:UI [sub-command] [argument]
```

Sub-commands include:

- borders with arguments like 'none', 'rounded', etc.
- theme with available theme names as arguments.
- numbers, relative_numbers, cursor_line, cursor_column, and transparency with arguments 'toggle', 'enable', or 'disable'.
- indents with the indent size as an argument.

#### Examples:

To change the borders to rounded:

```vim
:UI borders rounded
```

To enable line numbers:

```vim
:UI numbers enable
```

To change the theme:

```vim
:UI theme [theme_name]
```

To set the indent size to 4:

```vim
:UI indents 4
```

## Autocompletion

The UI command also supports autocompletion, which means you can press <TAB> and get suggestions to complete it. The same applies to the arguments of each sub-command.
