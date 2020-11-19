{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "norm";
      plugins = [ "aws" "ssh-agent" "vi-mode" ];
    };
    envExtra = ''
      EDITOR="vim"
      TERM="xterm-256color"
    '';
    shellAliases = {
      ll = "ls -lh";
    };
    initExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
      unsetopt BEEP
    '';
  };

  programs.dircolors = {
    enable = true;
  };
}
