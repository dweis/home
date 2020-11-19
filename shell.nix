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
      fonts = "fc-list | cut -f2 -d: | sort -u";
      nix-search = "nix-env -qaP '*' | grep";
      nix-cleanup = "nix-collect-garbage -d && nix-store --optimize";
    };
    initExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
      unsetopt BEEP
    '';
  };
}
