{ pkgs, ... }:
{
  dconf.settings = {
    "/org/gnome/desktop/input-sources" = {
      sources = "('xkb', 'us+dvorak')";
    };
  };
}
