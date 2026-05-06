flakeInputs:
let
  inherit (flakeInputs)
    self
    home-manager
    nixpkgs
    noctalia
    ;
in
{
  "riley-framework" =
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        self.homeManagerModules.framework
        noctalia.homeManagerModules.default
      ];

    };
}
