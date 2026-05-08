{ pkgs, ... }:
{
  config = {

    services = {
      displayManager = {
        gdm.enable = true;
        sessionPackages = [pkgs.niri];
      };
      desktopManager.gnome.enable = true;
    };

    programs.niri.enable = true;

    environment.gnome.excludePackages = (
      with pkgs;
      [
        gedit
        cheese # webcam tool
        epiphany # web browser
        geary # email reader
        gnome-characters
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        yelp # Help view

        gnome-initial-setup
        gnome-tour
        gnome-calculator
        gnome-calendar
        gnome-characters
        gnome-clocks
        gnome-contacts
        gnome-font-viewer
        gnome-logs
        gnome-maps
        gnome-music
        gnome-photos
        gnome-screenshot
        gnome-system-monitor
        gnome-weather
        gnome-disk-utility
        pkgs.gnome-connections
      ]
    );

    programs.dconf.enable = true;

    environment.etc."dconf/profile/gdm".text = ''
      user-db:user
      system-db:gdm
    '';

    environment.etc."dconf/db/gdm.d/00-background".text = ''
      [org/gnome/desktop/background]
      picture-options='none'
      color-shading-type='solid'
      primary-color='#1a1b26'
      secondary-color='#1a1b26'

      [org/gnome/desktop/screensaver]
      picture-options='none'
      color-shading-type='solid'
      primary-color='#1a1b26'
      secondary-color='#1a1b26'
    '';

    environment.systemPackages = with pkgs; [ gnome-tweaks ];
  };
}
