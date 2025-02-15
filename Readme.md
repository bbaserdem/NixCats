# NixCats

This is my Neovim config flake, meant to work with my NixOS systems,
but also any system that runs nix.

In time, this will be my replacement for nvim command on my computer.

This flake is a configuration of the [**nixCats**](https://github.com/BirdeeHub/nixCats-nvim) framework.

# Todo

Just items to do later once config is stable

- [ ] Modify the category handler to have multiple categories
- [ ] Set up linters; bash, dash, dotenv_linter, systemdlint, zsh
- [ ] Find alternative to catppuccin for gruvbox
- [ ] Find startup time alternative for snacks.dashboard
- [ ] Snacks explorer not working; explorer not in nixpkgs yet.
- [ ] Fix overlapping keybinds of mini.nvim
- [ ] Keybinds for aerial, snacks stuff, gitsigns, trouble, conform, obsidian, vimtex, nabla, mini-map
- [x] Fix diagnostic icons
- [x] Set up auto styling with conform on buffer exit, try to work it in pyproject.toml
- [x] Get conform stylers into requirements
- [x] Configure picker
- [x] Migrate all to deal with lze, for plugin guarding
- [x] Get rid of incline.nvim, and add winbar with aerial and filename to lualine
- [x] Enable catppuccin only on certain colorschemes in lazy
- [x] Split treesitter config into it's directory
- [x] Aerial, trouble - lualine integration
- [x] Do catppuccin integrations

# Workflow

Either use the provided packages (default is `nixCats-full` for now).
Plugins will be provided by nix.

Or use this flake as neovim config directory (`~/.config/nvim`).
[pckr.nvim](https://github.com/lewis6991/pckr.nvim) will be used to fetch plugins.
And [mason.nvim](https://github.com/williamboman/mason.nvim) will be used to fetch LSPs.

## Testing

Run `nix develop` to enter a shell with `nixCats-full` available.
