{ config, lib, pkgs, ... }:
let cfg = config.common.git; in
{
  options.common.git = {
    enable = lib.mkEnableOption "git configuration";
    userName = lib.mkOption {
      type = lib.types.str;
      description = "Git user name.";
    };
    userEmail = lib.mkOption {
      type = lib.types.str;
      description = "Git user email.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user.name = cfg.userName;
        user.email = cfg.userEmail;
        init.defaultBranch = "main";
        push.autoSetupRemote = "true";
        alias = {
          "ps" = "push";
          "a" = "add .";
          "st" = "status";
          "pl" = "pull";
          "sw" = "switch";
          "sc" = "switch -c";
          "c" = "commit -m";
        };
      };
    };
  };
}
