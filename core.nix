{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    elixir
    google-cloud-sdk
    htop
    nodejs
    stack
    yarn
  ];

  programs.fzf = {
    enable = true;
  };

  programs.readline = {
    enable = true;
    extraConfig = ''
      set editing-mode vi
      set keymap vi
      set bell-style none
    '';
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "tmux-256color";
  };
}
