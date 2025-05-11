{ config, pkgs, ... }:

{
  imports = [
    ./home/configs/git.nix
    ./home/configs/tmux.nix
    ./home/configs/helix.nix
    ./home/configs/joplin.nix
    ./home/configs/latex.nix
    ./home/configs/zathura.nix
  ];

  home = {

    username = "riley";

    homeDirectory = "/home/riley";

    stateVersion = "24.11"; # Please read the comment before changing.

    packages = with pkgs; [
      chromium

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

  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -alh";
      ".." = "cd ..";
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "ghostty";
      defaultWorkspace = "1";
      input = let
        # Framework internal components
        values = [
          "1:1:AT_Translated_Set_2_keyboard"
          "12972:6:FRMW0004:00_32AC:0006_Consumer_Control"
          "12972:6:FRMW0004:00_32AC:0006_Wireless_Radio_Control"
          "0:1:Power_Button"
          "0:6:Video_Bus"
        ];

        settings = {
          xkb_layout = "us";
          xkb_variant = "dvorak";
        };

        applyAll = x: {
          name = x;
          value = settings;
        };
      in builtins.listToAttrs (map applyAll values);
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
