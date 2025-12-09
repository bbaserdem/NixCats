# NixCats Neovim Keybinds Documentation

This document provides a comprehensive overview of all keybinds configured in this Neovim setup.

## Leader Key

The leader key is **`<Space>`** (space bar).

## Function Keys

| Function Key | Normal Mode Binding | Shift Variant |
|:---|:---|:---|
| **F1** | Help menu | - |
| **F2** | Rename symbols (LSP) | - |
| **F3** | Toggle light/dark mode | - |
| **F4** | Preview | - |
| **F5** | Start/continue debug (DAP) | `<S-F5>` Stop debug |
| **F6** | Toggle Claude AI | - |
| **F7** | Start/toggle build | - |
| **F8** | Next warning/error | `<S-F8>` Previous warning/error |
| **F9** | Toggle breakpoint | - |
| **F10** | Debug step over | - |
| **F11** | Debug step into | `<S-F11>` Debug step out |
| **F12** | *Reserved for tmux/desktop* | - |

## Leader Key Combinations

### AI Tools (`<Leader>a`)

| Keybind | Description |
|:---|:---|
| `<Leader>a<Space>` | Toggle Claude |
| `<Leader>af` | Focus Claude |
| `<Leader>ar` | Resume Claude |
| `<Leader>ac` | Continue Claude |
| `<Leader>am` | Select Claude model |
| `<Leader>ab` | Add current buffer |
| `<Leader>as` | Send to Claude (visual mode) / Add file to claude |
| `<Leader>ad` | Accept diff |
| `<Leader>aD` | Deny diff |
| `<Leader>aF` | Claude: add Files |
| `<Leader>a<C-f>` | Claude: Add Git files |
| `<Leader>ag` | Claude: Search (Get) and add files |
| `<Leader>aB` | Claude: Add buffers |
| `<Leader>a<C-d>` | Claude: Add directory |

### Buffer Management (`<Leader>b`)

| Keybind | Description |
|:---|:---|
| `<Leader>bn` | Next buffer |
| `<Leader>bN` | Previous buffer |
| `<Leader>bg` | First buffer |
| `<Leader>bG` | Last buffer |
| `<Leader>be` | New empty buffer |
| `<Leader>bd` | Delete buffer |
| `<Leader>bl` | List buffers (Telescope) |

### Code/LSP Functions (`<Leader>c`)

| Keybind | Description |
|:---|:---|
| `<Leader>cl` | Use linter |
| `<Leader>cf` | Format code (conform) |
| `<Leader>cr` | List LSP references |
| `<Leader>cc` | List LSP incoming calls |
| `<Leader>cC` | List LSP outgoing calls |
| `<Leader>ci` | Implementations for word |
| `<Leader>cd` | Definitions for word |
| `<Leader>ct` | Type definitions for word |
| `<Leader>cs` | List LSP buffer symbols |
| `<Leader>cS` | List LSP workspace symbols |
| `<Leader>c<C-S>` | Dynamically list LSP workspace symbols |
| `<Leader>cT` | List Treesitter queries |

### Debug Functions (`<Leader>d`)

| Keybind | Description |
|:---|:---|
| `<Leader>dX` | Diagnostics (Trouble) |
| `<Leader>dq` | QuickFix (Trouble) |
| `<Leader>dl` | LSP definitions/references (Trouble) |
| `<Leader>dL` | Location list (Trouble) |
| `<Leader>dd` | Search diagnostics (Telescope) |
| `zk` | Open floating diagnostic message |

### File Operations (`<Leader>f`)

| Keybind | Description |
|:---|:---|
| `<Leader>fy` | Launch Yazi (working dir) |
| `<Leader>fY` | Launch Yazi (current file) |
| `<Leader>fo` | Launch Oil |
| `<Leader>ft` | Toggle Neotree (left column) |
| `<Leader>fT` | Toggle Neotree (float) |
| `<Leader>ff` | Search for files in cwd |
| `<Leader>fg` | Grep for files in cwd |

### Git Functions (`<Leader>g`)

| Keybind | Description |
|:---|:---|
| `<Leader>gf` | Search git ls-files |
| `<Leader>gC` | Search commits |
| `<Leader>gc` | Search commits in buffer |
| `<Leader>gB` | Search branches |
| `<Leader>g?` | Search git status |
| `<Leader>gs` | Search stash |
| `<Leader>gn` | Next hunk |
| `<Leader>gp` | Previous hunk / Preview hunk |
| `<Leader>ga` | Stage hunk |
| `<Leader>gr` | Reset hunk |
| `<Leader>gA` | Stage buffer |
| `<Leader>gR` | Reset buffer |
| `<Leader>gi` | Preview hunk inline |
| `<Leader>gb` | Blame line |
| `<Leader>gd` | Diff |
| `<Leader>gD` | Diff (full document) |
| `<Leader>gk` | Quickfix list |
| `<Leader>gK` | All Quickfix list |
| `<Leader>g<C-b>` | Toggle line blame |
| `<Leader>g<C-d>` | Toggle word diff |

### Search Functions (`<Leader>s`)

| Keybind | Description |
|:---|:---|
| `<Leader>su` | Get buffer URLs |
| `<Leader>s<Space>` | Search pickers |
| `<Leader>sc` | Search colorschemes |
| `<Leader>sC` | Search color highlights |
| `<Leader>so` | Search previously open files |
| `<Leader>sh` | Search help tags |
| `<Leader>sm` | Search man pages |
| `<Leader>sr` | Search registers |

### UI Elements (`<Leader>u`)

| Keybind | Description |
|:---|:---|
| `<Leader>us` | Toggle Aerial symbols |
| `<Leader>uS` | Toggle Aerial navigation symbols |
| `<Leader>um` | Toggle MiniMap |

### View/Window Management (`<Leader>v`)

| Keybind | Description |
|:---|:---|
| `<Leader>v<Left>` | Navigate to left window |
| `<Leader>v<Down>` | Navigate to window below |
| `<Leader>v<Up>` | Navigate to window above |
| `<Leader>v<Right>` | Navigate to right window |
| `<Leader>vd` | Close window |
| `<Leader>vs` | Horizontal split window |
| `<Leader>vv` | Vertical split window |
| `<Leader>vn` | Next tab |
| `<Leader>vN` | Previous tab |
| `<Leader>vo` | Open new tab |
| `<Leader>vO` | Open new empty tab |
| `<Leader>vx` | Close tab |
| `<Leader>vX` | Close all other tabs |
| `<Leader>vj` | View jump list entries |

## Window Navigation (All Modes)

| Keybind | Description |
|:---|:---|
| `<C-h>` | Navigate to left window |
| `<C-j>` | Navigate to window below |
| `<C-k>` | Navigate to window above |
| `<C-l>` | Navigate to right window |

*Note: These also work in terminal mode*

## Text Objects

| Object | Description |
|:---|:---|
| `ih` | Select git hunk (operator/visual mode) |
