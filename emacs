(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/plugins/themes/emacs-color-theme-solarized/")

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar my-packages '(clojure-mode color-theme-zenburn))

(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

(require 'color-theme-solarized)
(require 'color-theme-zenburn)
(color-theme-zenburn)

(require 'linum)
(global-linum-mode)
