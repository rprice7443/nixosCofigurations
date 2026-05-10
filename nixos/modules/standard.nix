{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.common = {
    timezone = lib.mkOption {
      type = lib.types.str;
      default = "America/Los_Angeles";
      description = "System timezone.";
    };
    locale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "Default system locale.";
    };
    docker.enable = lib.mkEnableOption "Docker";
    libvirt.enable = lib.mkEnableOption "libvirtd and QEMU virtualization";
    audio.enable = lib.mkEnableOption "PipeWire audio";
    printing.enable = lib.mkEnableOption "printing support";
    openssh.enable = lib.mkEnableOption "OpenSSH server";
  };

  config = lib.mkMerge [
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      time.timeZone = config.common.timezone;
      i18n.defaultLocale = config.common.locale;

      fonts.enableDefaultPackages = true;
      security.polkit.enable = true;
      hardware.opengl.enable = true;
      services.envfs.enable = true;

      environment.systemPackages = with pkgs; [
        vim
        wget
        networkmanagerapplet
      ];

      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
          stdenv.cc.cc
          stdenv.cc.cc.lib
          zlib
          openssl
          glib
          fuse
          nss
          nspr
          dbus
          atk
          at-spi2-atk
          at-spi2-core
          libxkbcommon
          cups
          libdrm
          gtk3
          pango
          cairo
          xorg.libX11
          xorg.libXt
          xorg.libXcomposite
          xorg.libXdamage
          xorg.libXext
          xorg.libXfixes
          xorg.libXrandr
          xorg.libxcb
          mesa
          libgbm
          libGL
          expat
          xorg.libxkbfile
          xorg.libXtst
          alsa-lib
          udev
        ];
      };
    }

    (lib.mkIf config.common.openssh.enable {
      services.openssh = {
        enable = true;
        settings.X11Forwarding = true;
      };
    })

    (lib.mkIf config.common.audio.enable {
      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };
    })

    (lib.mkIf config.common.printing.enable {
      services.printing.enable = true;
    })

    (lib.mkIf config.common.docker.enable {
      virtualisation.docker.enable = true;
    })

    (lib.mkIf config.common.libvirt.enable {
      virtualisation.libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    })
  ];
}
