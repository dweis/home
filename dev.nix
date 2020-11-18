{ config, pkgs, ... }:

let cfg = import ./cfg.nix; in
{
  home.packages = with pkgs; [
    google-cloud-sdk
    htop
    stack
    nodejs
    sbt
    openjdk11
  ];

  programs.git = {
    enable = true;
    userName = "${cfg.name}";
    userEmail = "${cfg.email}";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig =
      ''
      set number
      set nowrap
      set showmode
      set smartcase
      set smartindent
      set softtabstop=2
      set shiftwidth=2
      set expandtab
      set history=1000
      set colorcolumn=80,100
      set list listchars=trail:.
      set completeopt=menuone,menu,longest
      set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox,output,node_modules,bower_components
      set wildmode=longest,list,full
      set t_Co=256
      set cmdheight=1
      colorscheme gruvbox
      " -- Supertab
      let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
      if has("gui_running")
        imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
      else " no gui
        if has("unix")
          inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
        endif
      endif
      " -- NERDtree
      map <Leader>n :NERDTreeToggle<CR>
      " -- Ctrl-P
      map <silent> <Leader>t :CtrlP()<CR>
      noremap <leader>b<space> :CtrlPBuffer<cr>
      let g:ctrlp_custom_ignore = '\v[\/]dist$'
      " -- Airline
      let g:airline_powerline_fonts = 1
      " -- HIE
      let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
      let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
      hi link ALEError Error
      hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
      hi link ALEWarning Warning
      hi link ALEInfo SpellCap
      nnoremap <F5> :call LanguageClient_contextMenu()<CR>
      map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
      map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
      map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
      map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
      map <Leader>lb :call LanguageClient#textDocument_references()<CR>
      map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
      map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
      '';

      plugins = with pkgs.vimPlugins; [
        coc-nvim
        sensible
        airline
        vim-nix
        syntastic
        ctrlp
        fzf-vim
        editorconfig-vim
        gruvbox
        nerdcommenter
        nerdtree
        supertab
        vim-scala
        vim-stylish-haskell
        hlint-refactor-vim
        haskell-vim
      ];
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "tmux-256color";
  };

  home.file.".ghci".text = ''
    :set editor ~/.nix-profile/bin/vi
  '';

  home.file.".haskeline".text = ''
    editMode: Vi
  '';

  home.file.".inputrc".text = ''
    set editing-mode vi
    set keymap vi
    set bell-style none
  '';
}
