(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(menu-bar-mode 0)
(column-number-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(load-theme 'gruber-darker t)
(add-to-list 'default-frame-alist
             '(font . "Source Code Pro-15"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
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


(use-package multiple-cursors
  :ensure t
  :config
  (multiple-cursors-mode 1))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1))

(use-package magit
  :ensure t)

(use-package swiper
  :ensure t)

(use-package smex
  :ensure t)

(use-package helm
  :ensure t)

(defun notes()
  (interactive)
  (find-file "~/notes/index.org"))

(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-p") 'helm-do-grep-ag)
(global-set-key (kbd "M-S") 'swiper)
(global-set-key (kbd "C-SPC") 'set-mark-command)

(global-set-key (kbd "C-c l")
  (lambda ()
    (interactive)
    (load-file user-init-file)))

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
   '("09b833239444ac3230f591e35e3c28a4d78f1556b107bafe0eb32b5977204d93" default))
 '(package-selected-packages
   '(ssh lua-mode zenburn-theme undo-tree swiper smex org-modern multiple-cursors markdown-mode magit key-chord helm gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
