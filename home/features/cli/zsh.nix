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
      eval "$(direnv hook zsh)"
      alias nhx='nix develop --command ${pkgs.helix}/bin/hx'
      export PATH=$PATH:/home/riley/.cargo/bin
      export PATH=$PATH:/home/riley/.npm-global/bin
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };
}
