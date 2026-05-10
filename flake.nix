{
  description = "Riley's common NixOS and home-manager modules";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, treefmt-nix, ... }:
  {
    homeManagerModules = import ./home/home-modules.nix { inherit self; };
    nixosModules = import ./nixos/nixos-modules.nix { inherit self; };
    formatter.x86_64-linux = import ./treefmt.nix { inherit nixpkgs treefmt-nix; };
  };
}
