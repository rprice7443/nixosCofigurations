{ config, pkgs, ... }: {
  programs.texlive = {
    enable = true;
    packageSet = pkgs.texlive.scheme-small;
  };
}
