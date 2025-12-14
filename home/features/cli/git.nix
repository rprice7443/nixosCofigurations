{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Riley Price";
      user.email = "rprice7443@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = "true";

      aliases = {
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
}
