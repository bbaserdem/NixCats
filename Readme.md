# NixCats

This is my Neovim config flake, meant to work with my NixOS systems,
but also any system that runs nix.

In time, this will be my replacement for nvim command on my computer.

This flake is a configuration of the [**nixCats**](https://github.com/BirdeeHub/nixCats-nvim) framework.

![render remote images](https://gist.ro/s/remote.png)

Try $\sum_{i = 1}^{10} \left| \hat{x}_i \right|^{2}$ equation rendering.

# Todo

Just items to do later once config is stable

- [ ] Ctrl-y not working as intended; nvim-cmp
- [ ] Add flash and hydra as plugins
- [ ] Document workflow in this readme
- [ ] Make shells to test paq-nvim
- [ ] Keybinds for aerial, snacks stuff, gitsigns, trouble, conform, obsidian, vimtex, nabla, mini-map, mini
- [~] Snacks explorer not working; explorer not in nixpkgs yet.

# Workflow

Either use the provided packages (default is `neovim-nixCats-full` for now).
Plugins will be provided by nix.

Or use this flake as neovim config directory (`~/.config/nvim`).
[paq-nvim](https://github.com/savq/paq-nvim) will be used to fetch plugins.
And [mason.nvim](https://github.com/williamboman/mason.nvim) will be used to fetch LSPs.

## Completion

- Up/Down and Ctrl+n/p (next/previous) for navigating completion.
- Enter selects entry, so should ctrl-y (yes).
  Ctrl-e ends the completion.
- Ctrl-space opens completion, or toggles documentation.
  Ctrl-b/f moves back and forth in the doc menu.
- Tab just moves to snippet parts, ctrl-tab moves around choice nodes.
  Terminal should be configured for ctrl-tab to be sent.

## Plugins

Any plugin action should come after leader key; space.


## Testing

Run `nix develop` to enter a shell with `neovim-nixCats-full` available.
