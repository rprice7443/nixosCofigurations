{
  description = "Riley's system configs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      nixosConfigurations."linux-framework" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/linux-framework/configuration.nix
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

}
