{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.common.desktop.enable {
    programs.waybar.enable = true;
  };
}
