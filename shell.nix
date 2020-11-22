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
      TMUX_TMPDIR=/tmp
    '';
    shellAliases = {
      ll = "ls -lh";
      new-scala = "sbt new scala/scala-seed.g8";
      new-haskell = "f(){ stack new \"$1\" ~/.stack/template.hsfiles };f";
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
