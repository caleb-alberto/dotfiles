(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(menu-bar-mode -1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn :no-confirm)

;; org modern
(use-package org-modern
  :ensure t
  :config
  (global-org-modern-mode 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Mononoki Nerd Font" :foundry "UKWN" :slant normal :weight bold :height 146 :width normal))))
 '(org-level-1 ((t (:height 1.5 :weight bold))))
 '(org-level-2 ((t (:height 1.3 :weight bold))))
 '(org-level-3 ((t (:height 1.2 :weight bold))))
 '(org-level-4 ((t (:height 1.1 :weight bold)))))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (python .t)))
(setq org-babel-python-command "python3")

;; multi cursor
(use-package multiple-cursors
  :ensure t
  :config
  (multiple-cursors-mode 1))

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

(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-p") 'counsel-rg)
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
 '(package-selected-packages '(multiple-cursors key-chord))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

