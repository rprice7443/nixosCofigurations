{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhsWithPackages (
      ps: with ps; [
        rustup
        zlib
      ]
    );
    mutableExtensionsDir = true;
  };
}
