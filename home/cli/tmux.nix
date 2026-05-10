{pkgs, config, ...}:
{
  programs.tmux = {
    enable = true;
    historyLimit = 5000;
    escapeTime = 0;
  };
} 
