flakeInputs:
let
  system = "x86_64-linux";
  inherit (flakeInputs) nixpkgs;
in
{
  "linux-framework" = let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  in
  nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ../hosts/linux-framework/configuration.nix
    ];
  };

  homeManagerModules = {
    home = import ./hosts/linux-framework/home.nix;
  };

  homeConfigurations = {
    "riley" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [ self.homeManagerModules.home ];

      extraSpecialArgs = {
        inherit inputs;
      };

    };
  };
};
