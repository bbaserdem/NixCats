-- <nixCats>/lsp/nixd.lua
-- Nixd LSP config

-- Where is our nixpkgs pointing to?
local this_nixpkgs = "import <nixpkgs> {}"
local this_nixos = ""
local this_homeManager = ""

-- Override for nixcats
if require("nixCatsUtils").isNixCats then
  local this_fdir = nixCats.extra("nix.flake")
  local this_host = nixCats.extra("nix.host")
  local this_user = nixCats.extra("nix.user")
  -- Define, if the variables are overloaded
  if this_fdir ~= "" then
    this_nixpkgs = '(builtins.getFlake "' .. this_fdir .. '").inputs.nixpkgs'
    if this_host ~= "" then
      this_nixos = '(builtins.getFlake "' .. this_fdir .. '").nixosConfigurations."' .. this_host .. '".options'
      if this_user ~= "" then
        this_homeManager = '(builtins.getFlake "'
          .. this_fdir
          .. '").homeConfigurations."'
          .. this_user
          .. "@"
          .. this_host
          .. '".options'
      end
    end
  end
end

vim.lsp.config("nixd", {
  cmd = { "nixd" },
  root_markers = {
    "flake.nix",
    "flake.lock",
  },
  filetypes = {
    "nix",
  },
  -- Global config options
  settings = {
    nixd = {
      nixpkgs = {
        expr = this_nixpkgs,
      },
      formatting = {
        command = { "nix", "fmt" },
      },
      options = {
        nixos = {
          expr = this_nixos,
        },
        home_manager = {
          expr = this_homeManager,
        },
      },
      -- Diagnostic system
      diagnostic = {
        suppress = {
          "sema-extra-with",
        },
      },
    },
  },
})
