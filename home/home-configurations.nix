flakeInputs:
let
  inherit (flakeInputs)
    self
    home-manager
    nixpkgs
    ;
in
{
  "riley-framework" =
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        overlays = [ self.overlays.noctalia ];
      };
    in
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        self.homeManagerModules.framework
      ];

    };
}
