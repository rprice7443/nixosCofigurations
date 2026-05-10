{ pkgs, ... }:
{
  programs.bash = {
    enable = false;
    shellAliases = {
      "ll" = "ls -alh";
      ".." = "cd ..";
    };
  };
}
