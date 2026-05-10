{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.common.desktop.enable {
    home.packages = [ pkgs.mako ];
  };
}
