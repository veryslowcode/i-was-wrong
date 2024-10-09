;; Turn on interface elements
(global-display-line-numbers-mode 1)

;; Turn off interface elements
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Enable behavior
(setq column-number-mode t)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Disable behavior
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)

;; Editor Settings
(set-face-attribute 'default nil
		      :height 140
		      :weight 'medium
                      :font "FiraCode Nerd Font Mono")

;; Emacs-isms
(setq custom-file "~/.emacs.custom.el")  ;; Stop emacs from editing this file
(setq backup-directory-alist '((".*" . "~/.config/emacs/backup/")))  ;; Clean up backups

;; Setup melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; External packages
(require 'use-package)

(use-package magit  ;; Version control
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package catppuccin-theme
  :ensure t
  :demand t
  :config
  (load-theme 'catppuccin t))

(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
;  ((java-mode . lsp)
  ((lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-java
  :config
  (add-hook 'java-mode-hook 'lsp))

(require 'lsp-java-boot)

;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
