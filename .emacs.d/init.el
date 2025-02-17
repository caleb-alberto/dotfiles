(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(menu-bar-mode -1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn :no-confirm)

;; undo tree
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1))

;; fuzzy finding
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

;; better command search
(use-package counsel
  :ensure t
  :after ivy
  :config
  (counsel-mode 1))

;; fuzzy search inside file
(use-package swiper
  :ensure t)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-S") 'swiper)
(global-set-key (kbd "C-SPC") 'set-mark-command)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f87c86fa3d38be32dc557ba3d4cedaaea7bc3d97ce816c0e518dfe9633250e34" default))
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(key-chord))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Mononoki Nerd Font" :foundry "nil" :slant normal :weight regular :height 150 :width normal)))))
