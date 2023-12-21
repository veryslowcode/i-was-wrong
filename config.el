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

;; Clean up file backups for 1. visual aesthetics and 2. git
(setq backup-directory-alist '((".*" . "~/.emacs.d/backup/")))

(global-display-line-numbers-mode 1) ;; Display line numbers
(delete-selection-mode 1)            ;; Delete selected text by typing

(set-face-attribute 'default nil
		    :font "FiraCode Nerd Font Mono"
		    :height 120
		    :weight 'medium)

(use-package doom-themes
    :init (load-theme 'doom-tomorrow-night t))

;; Ensure emacs version supports transparency
;; and if so, set transparency to 90%
(unless (version< "29.0.0" emacs-version)
  (set-frame-parameter (selected-frame) 'alpha-background 90)
  (add-to-list 'default-frame-alist '(alpha-background . 90)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Welcome to Emacs")
(setq dashboard-startup-banner 'logo)

(use-package magit)

(use-package rust-mode)

(use-package which-key)
(which-key-mode)
(setq which-key-side-window-location 'bottom)
