flakeInputs:
let
  inherit (flakeInputs) self home-manager nixpkgs;
in
{
  "riley-framework" = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [ self.homeManagerModules.home ];

    extraSpecialArgs = {
      inherit inputs;
    };

  };
}
