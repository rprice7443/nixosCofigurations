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
  ];

  home.packages = with pkgs; [
    firefox
    chromium
    anki
    xz
    element-desktop

    go
    forgejo-cli
    # terminal mainstays
    git
    git-lfs
    tmux
    ghostty
    ripgrep
    btop
    helix
    jq
    nodejs
    bat
    starship
    picocom
    mise
    gnupg
    nasm
    sshpass
    sway
    sops
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
    ssh-to-age

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

  programs.discord.enable = true;

  programs.home-manager.enable = true;

  xdg.configFile."niri/config.kdl".source = ../../xdgConfig/config.kdl;

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
