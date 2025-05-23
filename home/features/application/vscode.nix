{ config, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      vscodevim.vim 
      golang.go
    ];
    
    # mutableExtensionsDir = false;
    # profiles = [ default ];

    #profiles.default = {
    #  extensions = with pkgs.vscode-extensions; [
    #    bbenoist.nix
    #    vscodevim.vim
    #    golang.go
    #  ];
    #};
  };
}
