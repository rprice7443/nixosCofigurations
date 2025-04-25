{config, pkgs, ...} :
{
programs.git = {
    enable = true;
    aliases = {
      "ps" = "push";
      "a" = "add .";
      "st" = "status";
      "pl" = "pull";
      "sw" = "switch";
      "sc" = "switch -c";
    };
    extraConfig = {
      user.name = "Riley Price";
      user.email = "rprice7443@gmail.com";
      init.defaultBranch = "main";
  };
};
}
