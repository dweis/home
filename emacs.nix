{ config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    extraPackages = (epkgs: with epkgs; [
      # Evil mode
      evil
      evil-leader
      # Themes
      powerline
      airline-themes
      zenburn-theme
      # Language support
      haskell-mode
      js2-mode
      nix-mode
      scala-mode
    ]);
  };

  home.file.".emacs.d/init.el".source = ./emacs/init.el;
}
