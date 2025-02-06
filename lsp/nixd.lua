-- <nixCats>/lsp/nixd.lua
-- Nixd LSP config

vim.lsp.config('nixd', {
    cmd = { "nixd" },
    root_markers = {
        'flake.nix',
        'flake.lock',
    },
    -- Global config options
    settings = {
        nixd = {
            nixpkgs = {
                -- expr = '(builtins.getFlake ("/home/batuhan/Projects/NixOS")).inputs.nixpkgs {}',
                expr = 'import <nixpkgs> { }',
            },
            formatting = {
                command = { 'nix', 'fmt' },
            },
            options = {
                nixos = {
                    expr = '(builtins.getFlake ("/home/batuhan/Projects/NixOS")).nixosConfigurations.yel-ana.options',
                },
                home_manager = {
                    expr = '(builtins.getFlake ("/home/batuhan/Projects/NixOS")).homeConfigurations."batuhan@yel-ana".options',
                },
            },
            -- Diagnostic system
            diagnostic = {
                suppress = {
                    'sema-extra-with',
                },
            },
        },
    },
})
