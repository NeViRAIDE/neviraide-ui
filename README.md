# <div align = center>User Interface for [NEVIRAIDE](https://github.com/RAprogramm/NEVIRAIDE)</div>
 
## Features

Lightweight &amp; performant ui plugin for NEVIRAIDE providing:

<table><td><br>

> #### **_<div align="right">Dashboard (startup screen)</div>_**
>
> ![Dashboard](./.screenshots/dashboard.png)<br><br>

<hr>

> #### **_<div align="right">Statusline</div>_**
>
> ![Dashboard](./.screenshots/statusline.png)<br><br>

<hr>

> #### **_<div align="right">Buffers and tabs line</div>_**
>
> ![Dashboard](./.screenshots/buffertabs.png)<br><br>

<hr>

> #### **_<div align = right>Hyprland themes sync_**
>
> https://github.com/RAprogramm/neviraide-ui.nvim/assets/70325462/dc8a63ac-c632-41f4-beec-7e10602dcfae

</td></table>

## Installation

_Install neviraide-ui using your favorite plugin manager. For example, with [lazy.nvim](https://github.com/folke/lazy.nvim):_

```lua
require('lazy').load({
    plugins = {
        {
            'RAprogramm/neviraide-ui.nvim',
            event = 'VeryLazy',
            opts = {
                hyprdots = true, -- if you want to use sync NEVIRAIDE with hyprdots themes
                notify = true -- if you want to use custom notifications
            }
        },
    }
})
```

_Reload your Neovim configuration or restart Neovim._

_After this, neviraide-ui will be automatically downloaded, installed, and configured for you._

## Dependencies

- [plenary](https://github.com/nvim-lua/plenary.nvim)

### Optional dependencies

> - #### Icons
>
> _For display [nonicons](https://github.com/yamatsum/nonicons) instead of [devicons](https://github.com/vorillaz/devicons) run in your terminal:_
>
> ```sh
> yay -S nonicons-git
> ```
>
> _add this `symbol_map U+f101-U+f25c nonicons` to your kitty config._

## Overview

> _The code establishes commands in Neovim to control various aspects of the neviraide-ui plugin. The commands available are:_

- `Dashboard`: Toggles between displaying and hiding the dashboard.

- `UI`: A versatile command with various sub-commands to control UI settings:
  - `borders`: Sets border styles.
  - `numbers`: Toggles, enables, or disables line numbers.
  - `relative_numbers`: Toggles, enables, or disables relative line numbers.
  - `cursor_line`: Toggles, enables, or disables the cursor line.
  - `cursor_column`: Toggles, enables, or disables the cursor column.
  - `theme`: Changes the theme.
  - `indents`: Sets the indent size.

## Usage

### Dashboard Command:

```lua
NeviraideUIDashboard
```

> _Use this command to toggle the dashboard display on and off._

#### Examples:

To toggle line numbers:

```vim
:NeviraideUINumbers
```

<div align = right> <br><br>

[<kbd> <br> 🡅 <br> </kbd>](#table-of-contents)

</div>
