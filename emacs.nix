{ config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    extraPackages = (epkgs: with epkgs; [
      evil
      powerline
      haskell-mode
      js2-mode
      nix-mode
      scala-mode
      gruvbox-theme
      airline-themes
    ]);
  };

  home.file.".emacs.d/init.el".source = ./emacs/init.el;
}
