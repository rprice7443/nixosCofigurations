{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.common.packages.enable {
    home.packages = with pkgs; [
      # Browsers
      chromium
      firefox

      # Communication
      signal-desktop

      # Learning
      anki

      # Terminal mainstays
      atuin
      gh
      bat
      btop
      ghostty
      git
      git-lfs
      helix
      tree
      unzip
      picocom
      lazygit
      jq
      ripgrep
      starship
      tmux

      # Shell
      oh-my-zsh
      zsh

      # Development
      cargo
      clang
      forgejo-cli
      go
      just
      julia_110
      mise
      nasm
      nodejs
      rust-analyzer
      uv
      zed-editor
      cachix
      zls
      uv
      k9s
      python3
      grpcurl
      openssl
      dig

      # Wayland desktop
      kanshi
      slurp
      sway
      swaybg
      swaylock
      wdisplays
      xwayland-satellite

      # Media and files
      ffmpeg
      pulsemixer
      unzip
      xfce.thunar
      xz

      # Security and secrets
      gnupg
      sops
      ssh-to-age

      # System and networking
      acpi
      arp-scan
      nh
      picocom
      rainfrog
      sshpass
      nftables
      bpftools

      # Miscellaneous
      grip
    ];
  };
}
