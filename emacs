(add-to-list 'load-path "~/.emacs.d/")

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar my-packages '(color-theme-solarized
                      editorconfig
                      clojure-mode
                      cider
                      paredit
                      rainbow-delimiters))

(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

(load-theme 'solarized-dark t)

(load "editorconfig")

(require 'clojure-mode)

(require 'linum)
(global-linum-mode)

(menu-bar-mode 0)

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; Org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(add-hook 'org-mode-hook
	 (lambda ()
	   ;; Undefine C-c [ and C-c ] since this breaks my
	   ;; org-agenda files when directories are include It
	   ;; expands the files in the directories individually
	   (org-defkey org-mode-map "\C-c["    'undefined)
	   (org-defkey org-mode-map "\C-c]"    'undefined))
	 'append)

(setq org-log-done t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/docs/org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
