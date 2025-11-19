# NixCats

![Local logo](logo.png)

This is my Neovim config flake, meant to work with my NixOS and Nix-Darwin systems.
It is also configured to work without nix.

This flake is a configuration of the [**nixCats**](https://github.com/BirdeeHub/nixCats-nvim) framework.

# Todo

Just items to do later once config is stable

- [ ] Terminal has glitched prompt in starship
- [ ] snacks.image is not rendering latex
- [ ] flash and snacks.picker setup
- [ ] snacks.layout maybe? perhaps add edgy?
- [ ] Ctrl-y not working as intended; nvim-cmp
- [ ] Document workflow in this readme
- [ ] Make shells to test paq-nvim

# Workflow

## Setup

Plugins will be provided by nix.

In the absence of flakes, use this flake as neovim config directory (`~/.config/nvim`).
[paq-nvim](https://github.com/savq/paq-nvim) will be used to fetch plugins,
and [mason.nvim](https://github.com/williamboman/mason.nvim) will be used to fetch LSPs.

## Testing

Run `nix develop` to enter a shell with `nixCats` available for testing.

## Completion

- Up/Down and Ctrl+n/p (next/previous) for navigating completion.
- Enter selects entry, so should ctrl-y (yes).
  Ctrl-e ends the completion.
- Ctrl-space opens completion, or toggles documentation.
  Ctrl-b/f moves back and forth in the doc menu.
- Tab just moves to snippet parts, ctrl-tab moves around choice nodes.
  Terminal should be configured for ctrl-tab to be sent.

## Keybinds

Keybinds are split into global, and language specific in buffers.

Global actions are preceded with the leader key; which is ***space***.

### Language specific behavior

The function keys are for language specific actions such as debug or LSPs.
Some functionality is borrowed from [VSCode bindings](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf).

| Function Key | Binding |
| --- |:--- |
| F1  | Help menu |
| F2  | Rename symbols |
| F3  |  |
| F4  | Preview |
| F5  | Start/continue debug. (Shift: Stop debug) |
| F6  |  |
| F7  | Start/toggle build (continuous if available) |
| F8  | Go to error warning (Shift: reverse direction) |
| F9  | Toggle breakpoint |
| F10 | Debug step over |
| F11 | Debug step into (shift: step out) |
| F12 | *Unavailable* Will have tmux or desktop integration |


### Python

WIP
