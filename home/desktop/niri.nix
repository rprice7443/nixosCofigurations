{ pkgs, ... }:
{

  xdg.configFile."niri/config.kdl".source = ../../xdgConfig/niri/config.kdl;
  xdg.configFile."niri/cfg" = {
    source = ../../xdgConfig/niri/cfg;
    recursive = true;
  };
  xdg.configFile."kanshi/config".text = ''
    profile {
      output "BOE NE135A1M-NY1 Unknown" enable mode 2880x1920@120.000Hz scale 2 position 0,0
    }

    profile {
      output "BOE NE135A1M-NY1 Unknown" enable mode 2880x1920@120.000Hz scale 2 position 0,0
      output "Acer Technologies XZ342CU S3 4524001393V01" enable mode 3440x1440@180.000Hz scale 1 position 1440,0
    }
  '';

  programs.waybar = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ../../xdgConfig/waybar/config.jsonc);
    style = builtins.readFile ../../xdgConfig/waybar/style.css;
  };
}
