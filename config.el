(require 'package)

;; Enable package archives from both standard and melpa
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Turn off uneeded interface elements
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

;; Disable unwanted interface behaviour
(setq inhibit-startup-message t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq pop-up-windows nil)
(setq ring-bell-function 'ignore)

(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Clean up file backups for 1. visual aesthetics and 2. git
(setq backup-directory-alist '((".*" . "~/.config/emacs/backup/")))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(setq org-agenda-files '("~/Development/agenda"))

(global-display-line-numbers-mode 1)
(delete-selection-mode 1)  ;; Delete selected text by typing
(setq column-number-mode t)

(keymap-global-set "C-c e" 'eshell-command)

(set-face-attribute 'default nil
		    :font "FiraCode Nerd Font Mono"
		    :height 120
		    :weight 'medium)

(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-material-dark t))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Welcome to Emacs")
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((bookmarks . 5)
			(projects . 5)
			(agenda . 5)))

(defvar date-format "DATE: %D")
(defun comment-heading ()
	   (interactive)
	   (insert "/*******************************************************************************/
/********************************************************************************
* DESCRIPTION:
* AUTHOR: jb\n* ")
	   (insert (format-time-string date-format (current-time)))
	   (insert "\n********************************************************************************/
/*******************************************************************************/"))

(defun comment-section ()
       (interactive)
       (insert "/******************************************************************************/
/*******************************************************************************
* 
*******************************************************************************/
/******************************************************************************/"))

(use-package magit
  :ensure t)

(use-package company
  :ensure t)

(use-package rust-mode
    :ensure t)
;;  (setq rust-format-on-save t)
  (add-hook 'rust-mode-hook 'eglot-ensure)

(use-package vterm
  :ensure t)
(setq vterm-always-compile-module t)

(use-package projectile
:config
(projectile-global-mode 1))
