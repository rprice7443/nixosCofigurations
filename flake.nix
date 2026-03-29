{
  description = "Riley's system configs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = flakeInputs : {
    nixosConfigurations = import ./nixos/nixos-configurations.nix flakeInputs;
    homeManagerModules = import ./home/home-modules.nix flakeInputs;
    homeConfigurations = import ./home/home-configurations.nix flakeInputs;
  };
}
