(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(menu-bar-mode 0)
(column-number-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(load-theme 'gruber-darker t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Mononoki Nerd Font" :foundry "nil" :slant normal :weight regular :height 165 :width normal)))))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (calc . t)
   (python . t)))
(setq org-babel-python-command "python3")
(setq org-link-frame-setup '((file . find-file)))
(setq org-file-apps
      '(("\\.pdf\\'" . "open -a Firefox %s")
	(auto-mode . emacs)))

(defun my-cpp-style ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil))

(add-hook 'c++-mode-hook 'my-cpp-style)
(add-hook 'c-mode-hook 'my-cpp-style)

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

;; magit
(use-package magit
  :ensure t)

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

(defun notes()
  (interactive)
  (find-file "~/notes/index.org"))

(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-p") 'counsel-rg)
(global-set-key (kbd "M-S") 'swiper)
(global-set-key (kbd "C-SPC") 'set-mark-command)

(setq interprogram-cut-function
      (lambda (text &optional push)
    (let* ((process-connection-type nil)
	   (pbproxy (start-process "pbcopy" "pbcopy" "/usr/bin/pbcopy")))
      (process-send-string pbproxy text)
      (process-send-eof pbproxy))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f87c86fa3d38be32dc557ba3d4cedaaea7bc3d97ce816c0e518dfe9633250e34" default))
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(gruber-darker-theme helm multiple-cursors key-chord))
 '(scroll-bar-mode nil)
 '(send-mail-function 'mailclient-send-it)
 '(tool-bar-mode nil))
