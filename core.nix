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
    escapeTime = 0;
    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key H resize-pane -L 5
      bind-key J resize-pane -D 5
      bind-key K resize-pane -U 5
      bind-key L resize-pane -R 5

      bind-key C-b last-pane
    '';
  };
}
