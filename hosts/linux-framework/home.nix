{ config, pkgs, ... }:

{
  imports = [
    ../../home/features/cli/git.nix
    ../../home/features/cli/tmux.nix
    ../../home/features/cli/helix.nix
    ../../home/features/application/joplin.nix
    ../../home/features/cli/latex.nix
    ../../home/features/application/zathura.nix
    ../../home/features/application/vscode.nix
    ../../home/features/cli/fzf.nix
    ../../home/features/cli/bash.nix
    ../../home/features/cli/zsh.nix

    # Use Sway
    ../../home/features/desktop/sway.nix
    # ../../home/features/desktop/gnome.nix
  ];

  home.packages = with pkgs; [
    chromium
    anki

    # terminal mainstays
    git
    tmux
    ghostty
    ripgrep
    btop

    # battery status
    acpi

    # audio mixer
    pulsemixer

    # unzip files
    unzip
  ];

  home = {

    username = "riley";

    homeDirectory = "/home/riley";

    stateVersion = "24.11"; # Please read the comment before changing.

    file = { };

    sessionVariables = { };

    pointerCursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
      x11 = {
        enable = true;
        defaultCursor = "Adwaita";
      };
    };

    keyboard = {
      layout = "us";
      variant = "dvorak";
    };

  };

  programs.home-manager.enable = true;

}
