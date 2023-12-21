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

(global-display-line-numbers-mode 1)
(delete-selection-mode 1)  ;; Delete selected text by typing
(setq column-number-mode t)

(use-package evil
    :demand t
    :init
    :config
    (evil-mode t))

(keymap-global-set "C-c e" 'eshell-command)

(set-face-attribute 'default nil
		    :font "FiraCode Nerd Font Mono"
		    :height 120
		    :weight 'medium)

(use-package catppuccin-theme
  :demand t
  :config
  (load-theme 'catppuccin t))

(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Nano beats Emacs and Neovim!")
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((bookmarks . 5)
			(projects . 5)
			(agenda . 5)))

(use-package magit
  :ensure t)

(use-package company
  :ensure t)
