{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "ghostty";
      defaultWorkspace = "workspace number 1";
      bars = [
        { command = "${pkgs.waybar}/bin/waybar"; }
      ];

      menu = "${pkgs.fuzzel}/bin/fuzzel";
      input =
        let
          # Framework internal components
          values = [
            "1:1:AT_Translated_Set_2_keyboard"
            "12972:6:FRMW0004:00_32AC:0006_Consumer_Control"
            "12972:6:FRMW0004:00_32AC:0006_Wireless_Radio_Control"
            "0:1:Power_Button"
            "0:6:Video_Bus"
          ];

          settings = {
            xkb_layout = "us";
            xkb_variant = "dvorak";
          };

          applyAll = x: {
            name = x;
            value = settings;
          };
        in
        builtins.listToAttrs (map applyAll values);
    };
  };

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        position = "bottom";
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "wlr/taskbar"
        ];

        modules-center = [ "clock" ];

        modules-right = [
          "pulseaudio"
          "network"
          "battery"
        ];

        "pulseaudio" = {
          "on-click" = "pavucontrol";
        };
      };
    };
  };
}
