{ pkgs, ... }:
{

  xdg.configFile."niri/config.kdl".source = ../../xdgConfig/niri/config.kdl;
  xdg.configFile."niri/cfg" = {
    source = ../../xdgConfig/niri/cfg;
    recursive = true;
  };
  xdg.configFile."kanshi/config".source = ../../xdgConfig/kanshi/config;

  programs.waybar = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ../../xdgConfig/waybar/config.jsonc);
    style = builtins.readFile ../../xdgConfig/waybar/style.css;
  };
}
