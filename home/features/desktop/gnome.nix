{ pkgs, lib, ... }:

with lib.hm.gvariant;
{
  # services.dbus = {
  #  enable = true;
  #  packages = [ pkgs.gnome3.dconf ];
  # };

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [
        (mkTuple [
          "xkb"
          "us+dvorak"
        ])
      ];
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "chromium-browser.desktop" 
        "codium.desktop" 
        "com.mitchellh.ghostty.desktop" 
        "org.gnome.Nautilus.desktop"
      ];
    };
  };
}
