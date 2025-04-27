{ config, pkgs, ... }:

{
  imports = [
    ./home/configs/git.nix
    ./home/configs/tmux.nix
    ./home/configs/helix.nix
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
    ];
    
    file = {};

    sessionVariables = {};

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
      input = {
        "type:keyboard" = {
          xkb_layout = "us";
          xkb_variant = "dvorak";
        };
      };
        
    };
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
