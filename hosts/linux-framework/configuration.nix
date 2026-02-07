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
    ../../nixos/flavors/desktop/kde.nix

    # ../../nixos/flavors/desktop/sway.nix
    # ../../nixos/flavors/desktop/gnome.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  programs.xwayland.enable = true;

  programs.mosh.enable = true;
  services.tailscale.enable = true;
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    ensureDatabases = [ "default" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database DBuser origin-address auth-method
      local all      all     trust
      # ... other auth rules ...

      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host  all      all     ::1/128        trust
    '';
  };

  networking = {
    hostName = "nixos"; # Define your hostname.

    # Easiest to use and most distros use this by default.
    networkmanager = {
      enable = true;
      dns = "dnsmasq";
    };

    firewall.allowedTCPPorts = [
      22
      28981
    ];

    firewall.allowedUDPPorts = [
      53
      67
    ];
  };

  services.hardware.bolt.enable = true;

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        # ovmf = {
        #   # not needed in NixOS 25.11 since https://github.com/NixOS/nixpkgs/pull/421549
        #   enable = true;
        #   packages = [
        #     (pkgs.OVMF.override {
        #       secureBoot = true;
        #       tpmSupport = true;
        #     }).fd
        #   ];
        # };
      };
    };
  };

  services.blueman.enable = true;

  # beekeeb Piantor Pro
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", ATTRS{idVendor}=="beeb", ATTRS{idProduct}=="0002", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

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

  programs.zsh.enable = true;
  users.users.riley.shell = pkgs.zsh;

  # services.dnsmasq = {
  #   enable = true;
  # };

  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
    ];

  };

  services.envfs.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.riley = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager"
      "video" # So I can change the brightness...
      "libvirtd"
      "docker"
    ];
    packages = with pkgs; [ tree ];
  };

  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste
    mako
    libsecret
    zig
    virt-manager
    pkg-config
    docker

    kdePackages.plasma-thunderbolt
    dnsmasq
    bind

    #  Gnome packages
    # adwaita-icon-theme
    # gnome-themes-extra
    # gnomeExtensions.appindicator
  ];

  virtualisation.docker = {
    enable = true;
  };

  # services.udev.packages = with pkgs; [
  #   gnome-settings-daemon
  # ];

  security.polkit.enable = true;

  # enable flakes, etc
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # programs.sway = {
  #   enable = true;
  #   package = null;
  # };

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
  #     };
  #   };
  # };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings.X11Forwarding = true;
  };
  programs.light.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  # Most users should NEVER change this value after the initial install, for any reason
  system.stateVersion = "24.11"; # Did you read the comment?

}
