flakeInputs:
let
  system = "x86_64-linux";
  inherit (flakeInputs) nixpkgs self;
in
{
  "linux-framework" = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ../hosts/linux-framework/configuration.nix
      {
        nixpkgs.config.allowUnfree = true;
      }
    ];
  };

}
