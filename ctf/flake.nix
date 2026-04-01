{
  description = "C/C++ debug";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {

    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        gcc
        clang-tools
        gdb
        gef
        python312
        python312Packages.pwntools
        glibc_multi
        sage
        pyright
        python312Packages.pycryptodome
        python312Packages.httpx
        unixtools.xxd
        ltrace
        php
        python312Packages.fastecdsa
        typescript-language-server
        python312Packages.pyjwt
        python312Packages.sympy
        nasm
        one_gadget
        pwninit
        python312Packages.ropper
        nodejs
      ];
    };

  };
}
