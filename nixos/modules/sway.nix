{ pkgs, ... }: {
  services.gnome.gnome-keyring.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    # config = rec {
    #   modifier = "Mod4";
    #   terminal = "ghostty";
    #   defaultWorkspace = "1";
    #   input = let
    #     # Framework internal components
    #     values = [
    #       "1:1:AT_Translated_Set_2_keyboard"
    #       "12972:6:FRMW0004:00_32AC:0006_Consumer_Control"
    #       "12972:6:FRMW0004:00_32AC:0006_Wireless_Radio_Control"
    #       "0:1:Power_Button"
    #       "0:6:Video_Bus"
    #     ];

    #     settings = {
    #       xkb_layout = "us";
    #       xkb_variant = "dvorak";
    #     };

    #     applyAll = x: {
    #       name = x;
    #       value = settings;
    #     };
    #   in builtins.listToAttrs (map applyAll values);
    # };
  };
}
