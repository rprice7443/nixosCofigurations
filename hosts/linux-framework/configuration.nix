# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../nixos/hardware/bluetooth/bluetooth.nix

    # ../../nixos/flavors/desktop/sway.nix
    ../../nixos/flavors/desktop/gnome.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "nixos"; # Define your hostname.

    # Easiest to use and most distros use this by default.
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # enable fonts
  fonts.enableDefaultPackages = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.riley = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager"
      "video" # So I can change the brightness...
    ];
    packages = with pkgs; [ tree ];
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste
    mako
  ];

  security.polkit.enable = true;

  # enable flakes, etc
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  programs.light.enable = true;

  # Most users should NEVER change this value after the initial install, for any reason
  system.stateVersion = "24.11"; # Did you read the comment?

}
