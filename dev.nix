{ config, pkgs, ... }:

let cfg = import ./cfg.nix; in
{
  programs.git = {
    enable = true;
    userName = "${cfg.name}";
    userEmail = "${cfg.email}";
  };
}
