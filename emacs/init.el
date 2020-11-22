(require 'package)
(setq package-archives nil)
(setq package-enable-at-startup nil)

(require 'evil)
(evil-mode 1)

(require 'powerline)
(require 'airline-themes)
(require 'zenburn-theme)

(load-theme 'zenburn t)
(load-theme 'airline-zenburn t)

(require 'nix-mode)
(require 'haskell-mode)
(require 'scala-mode)
(require 'js2-mode)
