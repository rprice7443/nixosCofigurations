{ pkgs, ... }:
{

  xdg.configFile."niri/config.kdl".source = ../../xdgConfig/niri/config.kdl;
  xdg.configFile."niri/cfg" = {
    source = ../../xdgConfig/niri/cfg;
    recursive = true;
  };

  programs.waybar = {
    enable = true;
    settings = builtins.fromJSON ../../xdgConfig/waybar/config.jsonc;
  };
}
