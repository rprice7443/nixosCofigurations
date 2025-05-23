{ pkgs, lib, ... }:

with lib.hm.gvariant;
{
  dconf.settings = {
    "/org/gnome/desktop/input-sources" = {
      show-all-sources = true;
      sources = [
        (mkTuple [
          "xkb"
          "us+dvorak"
        ])
      ];
    };
  };
}
