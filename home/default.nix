{ config, lib, ... }:
let
  colors = (import ./colors.nix).tokyoNight;

  # Recursively enumerate all files under a directory, returning relative paths.
  listFilesRecursive =
    dir:
    let
      entries = builtins.readDir dir;
      process =
        name: type:
        if type == "directory" then
          map (f: "${name}/${f}") (listFilesRecursive "${dir}/${name}")
        else
          [ name ];
    in
    lib.flatten (lib.mapAttrsToList process entries);

  processFile =
    path:
    let
      content = builtins.readFile path;
      keys = builtins.attrNames colors;
    in
    builtins.replaceStrings (map (k: "@${k}@") keys) (map (k: colors.${k}) keys) content;

  # Build a xdg.configFile attrset from an xdgConfig/ directory inside src.
  xdgFiles =
    src:
    let
      xdgDir = "${src}/xdgConfig";
    in
    lib.listToAttrs (
      map (f: {
        name = f;
        value = {
          text = processFile "${xdgDir}/${f}";
        };
      }) (listFilesRecursive xdgDir)
    );
in
{
  imports = [
    ./packages.nix
    ./cli/git.nix
    ./cli/zsh.nix
    ./cli/helix.nix
    ./cli/tmux.nix
    ./cli/fzf.nix
    ./cli/latex.nix
    ./application/zed.nix
    ./application/joplin.nix
    ./application/zathura.nix
    ./desktop/niri.nix
    ./desktop/mako.nix
    ./desktop/fuzzel.nix
  ];

  options.common = {
    src = lib.mkOption {
      type = lib.types.path;
      description = "Path to the nixos-common flake source. Set to `inputs.nixos-common` in your consumer flake.";
    };
    hostSrc = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "Path to a host-specific source tree containing an xdgConfig/ subdirectory. Files here override those from common src.";
    };
    packages.enable = lib.mkEnableOption "standard home packages";
    cli.enable = lib.mkEnableOption "common CLI tools (zsh, helix, tmux, fzf, latex)";
    applications.enable = lib.mkEnableOption "common GUI applications (vscode, zed, joplin, zathura)";
    desktop.enable = lib.mkEnableOption "common desktop environment (niri, waybar, mako, fuzzel)";
  };

  config = {
    xdg.configFile =
      (lib.optionalAttrs (builtins.pathExists "${config.common.src}/xdgConfig") (
        xdgFiles config.common.src
      ))
      // (lib.optionalAttrs (
        config.common.hostSrc != null && builtins.pathExists "${config.common.hostSrc}/xdgConfig"
      ) (xdgFiles config.common.hostSrc));

    programs.home-manager.enable = true;

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
