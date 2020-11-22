{ config, pkgs, ... }:

let cfg = import ./cfg.nix; in
{
  programs.git = {
    enable = true;
    userName = "${cfg.name}";
    userEmail = "${cfg.email}";
    extraConfig = {
      pull = {
        ff = "only";
      };
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        interactive = "auto";
        ui = "true";
        pager = "true";
      };
    };
  };
}
