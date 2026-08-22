{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        haskell = pkgs.haskellPackages;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            haskell.ghc
            pkgs.cabal-install
            pkgs.stack
            pkgs.git
            pkgs.zlib
            pkgs.pkg-config
          ];
        };

        packages.default = pkgs.haskellPackages.callCabal2nix "fastpass" ./. {};
      });
}

