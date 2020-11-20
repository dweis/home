{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    sbt
    openjdk11
  ];
}
