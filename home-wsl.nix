{ config, pkgs, home, ... }:

{
  imports = [
    ./core.nix
    ./dev.nix
    ./emacs.nix
    ./haskell.nix
    ./scala.nix
    ./shell.nix
    ./vim.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "derrick";
  home.homeDirectory = "/home/derrick";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
