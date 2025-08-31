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

    initContent = ''
      eval "$(${pkgs.mise}/bin/mise activate zsh)"
      eval "$(starship init zsh)"
      eval "$(atuin init zsh)"
      alias nhx='nix develop --command bash -C ${pkgs.helix}/bin/helix'
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
