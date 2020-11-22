(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq indent-tabs-mode nil)
(setq default-tab-width 2)

(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

(require 'evil)
(evil-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "\\")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "w" 'save-buffer)

(require 'zenburn-theme)

(load-theme 'zenburn t)

(require 'powerline)
(require 'airline-themes)
(load-theme 'airline-zenburn t)

(require 'nix-mode)
(require 'haskell-mode)
(require 'scala-mode)
(require 'js2-mode)
