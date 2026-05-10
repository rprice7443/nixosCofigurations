{
  description = "Riley's common NixOS and home-manager modules";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, ... }:
  {
    homeManagerModules = import ./home/home-modules.nix { inherit self; };
    nixosModules = import ./nixos/nixos-modules.nix { inherit self; };
  };
}
