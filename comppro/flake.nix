{
  description = "Competetive Programming devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            pyright
          ];
          packages = with pkgs; [
            gcc
            gdb
            clang-tools
            python3
          ];
          shellHook = ''
            cat << 'EOF' > .nvim.lua
            vim.lsp.enable('pyright')
            vim.lsp.enable('clangd')
            EOF
          '';
        };
      }
    );
}
