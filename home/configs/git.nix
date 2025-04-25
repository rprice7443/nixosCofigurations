{config, pkgs, ...} :
{
programs.git = {
    enable = true;
    extraConfig = {
      user.name = "Riley Price";
      user.email = "rprice7443@gmail.com";
      init.defaultBranch = "main";
  };
};
}
