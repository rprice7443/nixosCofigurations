{ config, pkgs, ... }: {
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
}
