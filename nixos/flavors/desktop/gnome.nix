{ pkgs, ... }:
{
  config = {

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

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
    environment.systemPackages = with pkgs; [ gnome-tweaks ];
  };
}
