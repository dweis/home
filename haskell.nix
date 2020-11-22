{ config, pkgs, ... }:

let cfg = import ./cfg.nix; in
{
  home.file.".ghci".text = ''
    :set editor ~/.nix-profile/bin/vi
  '';

  home.file.".haskeline".text = ''
    editMode: Vi
  '';

  home.file.".stack/config.yaml".text = ''
    templates:
      params:
        author-email: ${cfg.email}
        author-name: ${cfg.name}
        copyright: ${cfg.copyright}
        github-username: ${cfg.githubUsername}
        category: Development
  '';

  home.file.".stack/template.hsfiles".source = ./haskell/template.hsfiles;
}
