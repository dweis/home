{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./files/vimrc;

    plugins = with pkgs.vimPlugins; [
      sensible
      coc-nvim
      airline
      vim-nix
      syntastic
      fzf-vim
      editorconfig-vim
      gruvbox
      nerdcommenter
      nerdtree
      # Scala
      coc-metals
      vim-scala
      # Haskell
      haskell-vim
      vim-stylish-haskell
      hlint-refactor-vim
      # Elixir
      vim-elixir
    ];
  };

  home.file.".config/nvim/coc-settings.json".text = ''
    {
      "coc.preferences.formatOnSaveFiletypes": ["scala"],
      "metals.scalafmtConfigPath": "project/.scalafmt.conf",
      "languageserver": {
        "haskell": {
          "command": "haskell-language-server-wrapper",
          "args": ["--lsp"],
          "rootPatterns": ["*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml"],
          "filetypes": ["haskell", "lhaskell"]
        }
      }
    }
  '';
}
