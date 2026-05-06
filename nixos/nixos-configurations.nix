flakeInputs:
let
  system = "x86_64-linux";
  inherit (flakeInputs) nixpkgs;
in
{
  "linux-framework" =
    let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ self.overlays.noctalia ];
      };
    in
    nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ../hosts/linux-framework/configuration.nix
      ];
    };

}
