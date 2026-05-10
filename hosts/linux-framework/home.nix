{ config, pkgs, ... }:

{
  imports = [
    ../../home/cli/git.nix
    ../../home/cli/tmux.nix
    ../../home/cli/helix.nix
    ../../home/application/joplin.nix
    ../../home/cli/latex.nix
    ../../home/application/zathura.nix
    ../../home/application/vscode.nix
    ../../home/cli/fzf.nix
    ../../home/cli/bash.nix
    ../../home/cli/zsh.nix
    ../../home/application/zed.nix
    ../../home/desktop/niri.nix
    ../../home/desktop/mako.nix
    ../../home/desktop/fuzzel.nix
  ];

  home.packages = import ./std-home-pkgs.nix pkgs;

  home = {
    username = "riley";
    homeDirectory = "/home/riley";
    stateVersion = "24.11"; # Please read the comment before changing.
    file = { };
    sessionVariables = { };
  };

  programs.discord.enable = true;

  systemd.user.services.discord = {
    Unit = {
      Description = "Discord";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 5";
      ExecStart = "${pkgs.discord}/bin/discord --start-minimized";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
  programs.home-manager.enable = true;

  home.sessionVariables = {
    PKG_CONFIG_PATH = pkgs.lib.concatStringsSep ":" [
      "${pkgs.openssl.dev}/lib/pkgconfig"
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

}
