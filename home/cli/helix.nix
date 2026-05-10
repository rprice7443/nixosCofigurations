{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.common.cli.enable {
    programs.helix = {
      enable = true;
      settings = {
        theme = "autumn_night_transparent";
        keys = {
          normal = {
            "h" = "move_char_left";
            "t" = "move_visual_line_down";
            "n" = "move_visual_line_up";
            "s" = "move_char_right";
          };
        };
        editor = {
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
          bufferline = "multiple";
          rulers = [ 80 ];
          statusline = {
            left = [
              "mode"
              "spinner"
              "version-control"
              "file-name"
            ];
          };
        };
      };

      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        }
        {
          name = "go";
          auto-format = true;
        }
        {
          name = "zig";
          auto-format = true;
        }
        {
          name = "rust";
          auto-format = false;
        }
        {
          name = "typst";
          auto-format = true;
        }
      ];

      themes = {
        autumn_night_transparent = {
          "inherits" = "autumn_night";
          "ui.background" = { };
        };
      };
    };
  };
}
