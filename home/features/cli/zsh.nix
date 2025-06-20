{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "ll" = "ls -alh";
      ".." = "cd ..";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
