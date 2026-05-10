{ nixpkgs, treefmt-nix }:
let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
  fmt = treefmt-nix.lib.evalModule pkgs {
    projectRootFile = "flake.nix";
    programs.nixfmt.enable = true;
  };
in
fmt.config.build.wrapper
