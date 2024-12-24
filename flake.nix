{
  inputs = {
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
  {
    self,
    nixpkgs,
    systems,
  }:
  let
    forEachSystem =
      f: nixpkgs.lib.genAttrs (import systems) (system: f { pkgs = import nixpkgs { inherit system; }; });
  in
  {
    devShells = forEachSystem (
      { pkgs }:
      {
        default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            neovim
            black
            llvmPackages_19.clang-tools
            lua54Packages.luarocks
            ruff
            stylua
            codespell
            nodePackages.jsonlint
            mypy
            hadolint
            nodePackages.prettier
            yamllint
            luajitPackages.lua-lsp
            rubocop
            cmake-language-server
            markdownlint-cli
          ];
        };
      }
    );
  };
}
