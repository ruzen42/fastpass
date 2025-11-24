{
  description = "fastpass - Haskell password generator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        haskell = pkgs.haskellPackages;
        ghc = haskell.ghc9102;  # GHC 9.10.2
        hsDeps = haskell.ghcWithPackages (p: with p; [ text tasty random async optparse-applicative]);
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            ghc
            pkgs.cabal-install
            pkgs.git
            pkgs.zlib
            pkgs.pkg-config
          ];
        };

        packages.default = pkgs.haskellPackages.callCabal2nix "fastpass" ./. {};
      });
}

