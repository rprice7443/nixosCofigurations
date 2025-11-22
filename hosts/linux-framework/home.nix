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
    firefox
    chromium
    anki
    xz

    # terminal mainstays
    git
    tmux
    ghostty
    ripgrep
    btop
    helix
    jq
    bat
    starship
    picocom
    mise
    gnupg
    pinentry
    nasm
    sshpass
    sway
    wdisplays
    fuzzel
    slurp
    grip
    ffmpeg
    arp-scan
    julia_110
    atuin
    rainfrog
    zed-editor

    zls

    # battery status
    acpi
    just

    # audio mixer
    pulsemixer

    # unzip files
    unzip

    nh
    cargo
    clang

    zsh
    oh-my-zsh

    # file manager
    xfce.thunar

    uv

    rust-analyzer
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
