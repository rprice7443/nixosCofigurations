{
  description = "Riley's common NixOS and home-manager modules";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      home-manager,
      nixpkgs,
      treefmt-nix,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.home-manager.flakeModules.home-manager
        inputs.treefmt-nix.flakeModule
      ];
      flake = {
        homeModules = import ./home/home-modules.nix { inherit self; };
        nixosModules = import ./nixos/nixos-modules.nix { inherit self; };

        nixosConfigurations.check = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            self.nixosModules.standard
            self.nixosModules.gnome
            (
              { modulesPath, ... }:
              {
                imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
                boot.loader.grub.enable = false;
                fileSystems."/".device = "nodev";
              }
            )
          ];
        };
      };

      systems = [
        "x86_64-linux"
      ];

      perSystem =
        { config, pkgs, ... }:
        {
          treefmt = import ./treefmt.nix;
        };
    };
}
