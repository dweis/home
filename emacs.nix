{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    metals
  ];

  programs.emacs = {
    enable = true;
    extraPackages = (epkgs: with epkgs; [
      use-package
      # Evil mode
      evil
      evil-leader
      # Themes
      powerline
      airline-themes
      # Language support
      flycheck
      yasnippet
      posframe
      dap-mode
      company
      company-lsp
      haskell-mode
      lsp-mode
      lsp-ui
      lsp-haskell
      js2-mode
      nix-mode
      scala-mode
      sbt-mode
      lsp-metals
    ]);
  };

  home.file.".emacs.d/init.el".source = ./emacs/init.el;
}
