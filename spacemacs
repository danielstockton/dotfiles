;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     react
     typescript
     asciidoc
     nginx
     sql
     yaml
     rust
     javascript
     lsp
     dap
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pylsp
             python-formatter 'black
             python-format-on-save t
             python-pipenv-activate t
             flycheck-flake8rc ".flake8"
             flycheck-checker-error-threshold 2000)
     html
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     clojure
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     finance
     graphviz
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      editorconfig
                                      solidity-mode
                                      add-node-modules-path
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '((recents) (projects))
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (require 'golden-ratio)
  (golden-ratio-mode 1)

  (require 'editorconfig)
  (editorconfig-mode 1)

  (setq clojure-indent-style :always-align)
  (setq clojure-align-forms-automatically t)

  (eval-after-load 'js2-mode
    '(add-hook 'js2-mode-hook #'add-node-modules-path))
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)

  (setq-default
   js2-basic-offset 2
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(ledger-reports
   (quote
    (("checking" "ledger -f accounts.ledger balance Checking")
     ("net worth" "ledger -f accounts.ledger balance ^assets ^liabilities")
     ("bal ^assets ^liabilities" "ledger -f accounts.ledger balance ^assets ^liabilities")
     ("balance ^assets ^liabilities" "ledger balance ^assets ^liabilities")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)"))))
 '(package-selected-packages
   (quote
    (lv parseedn parseclj a tide typescript-mode adoc-mode markup-faces transient spinner json-snatcher json-reformat parent-mode fringe-helper git-gutter+ pos-tip flx treepy graphql web-completion-data peg eval-sexp-fu sesman bind-map popup add-node-modules-path solidity-mode nginx-mode org-mime epl ghub let-alist pythonic yaml-mode toml-mode racer flycheck-rust cargo rust-mode dash-functional org-category-capture tern sql-indent winum unfill fuzzy seq f s xterm-color ws-butler which-key web-mode use-package toc-org spaceline shell-pop restart-emacs pyvenv pug-mode persp-mode orgit org org-plus-contrib org-download neotree move-text mmm-mode markdown-toc live-py-mode ledger-mode info+ indent-guide hide-comnt help-fns+ helm-projectile helm-make helm-gitignore request helm-flx helm-c-yasnippet helm-ag gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe expand-region exec-path-from-shell evil-surround evil-nerd-commenter evil-mc evil-matchit evil-escape evil-ediff evil-anzu eshell-z editorconfig company-statistics column-enforce-mode clj-refactor cider clojure-mode auto-compile packed aggressive-indent ace-window auto-complete anaconda-mode iedit smartparens highlight evil flycheck flyspell-correct company helm helm-core yasnippet multiple-cursors avy skewer-mode js2-mode simple-httpd magit magit-popup git-commit with-editor async alert projectile hydra haml-mode dash spacemacs-theme yapfify window-numbering web-beautify volatile-highlights vi-tilde-fringe uuidgen undo-tree tagedit smeargle slim-mode scss-mode sass-mode rainbow-delimiters queue quelpa pytest pyenv-mode py-isort powerline popwin pkg-info pip-requirements pcre2el paredit paradox org-projectile org-present org-pomodoro org-bullets open-junk-file mwim multi-term markdown-mode magit-gitflow macrostep lorem-ipsum log4e livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc inflections ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-mode-manager helm-descbinds helm-css-scss helm-company goto-chg google-translate golden-ratio gnuplot gntp gitignore-mode gitconfig-mode git-gutter-fringe+ git-gutter gh-md flyspell-correct-helm flycheck-pos-tip flycheck-ledger flx-ido fill-column-indicator fancy-battery eyebrowse evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-args eshell-prompt-extras esh-help emmet-mode elisp-slime-nav edn dumb-jump diminish diff-hl define-word cython-mode company-web company-tern company-anaconda coffee-mode clojure-snippets clean-aindent-mode cider-eval-sexp-fu bind-key auto-yasnippet auto-highlight-symbol auto-dictionary anzu adaptive-wrap ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(ledger-reports
   (quote
    (("checking" "ledger -f accounts.ledger balance Checking")
     ("net worth" "ledger -f accounts.ledger balance ^assets ^liabilities")
     ("bal ^assets ^liabilities" "ledger -f accounts.ledger balance ^assets ^liabilities")
     ("balance ^assets ^liabilities" "ledger balance ^assets ^liabilities")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)"))))
 '(package-selected-packages
   (quote
    (lsp-ui lsp-python-ms lsp-pyright lsp-origami origami helm-lsp dap-mode lsp-treemacs bui lsp-mode lv parseedn parseclj a tide typescript-mode adoc-mode markup-faces transient spinner json-snatcher json-reformat parent-mode fringe-helper git-gutter+ pos-tip flx treepy graphql web-completion-data peg eval-sexp-fu sesman bind-map popup add-node-modules-path solidity-mode nginx-mode org-mime epl ghub let-alist pythonic yaml-mode toml-mode racer flycheck-rust cargo rust-mode dash-functional org-category-capture tern sql-indent winum unfill fuzzy seq f s xterm-color ws-butler which-key web-mode use-package toc-org spaceline shell-pop restart-emacs pyvenv pug-mode persp-mode orgit org org-plus-contrib org-download neotree move-text mmm-mode markdown-toc live-py-mode ledger-mode info+ indent-guide hide-comnt help-fns+ helm-projectile helm-make helm-gitignore request helm-flx helm-c-yasnippet helm-ag gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe expand-region exec-path-from-shell evil-surround evil-nerd-commenter evil-mc evil-matchit evil-escape evil-ediff evil-anzu eshell-z editorconfig company-statistics column-enforce-mode clj-refactor cider clojure-mode auto-compile packed aggressive-indent ace-window auto-complete anaconda-mode iedit smartparens highlight evil flycheck flyspell-correct company helm helm-core yasnippet multiple-cursors avy skewer-mode js2-mode simple-httpd magit magit-popup git-commit with-editor async alert projectile hydra haml-mode dash spacemacs-theme yapfify window-numbering web-beautify volatile-highlights vi-tilde-fringe uuidgen undo-tree tagedit smeargle slim-mode scss-mode sass-mode rainbow-delimiters queue quelpa pytest pyenv-mode py-isort powerline popwin pkg-info pip-requirements pcre2el paredit paradox org-projectile org-present org-pomodoro org-bullets open-junk-file mwim multi-term markdown-mode magit-gitflow macrostep lorem-ipsum log4e livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc inflections ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-mode-manager helm-descbinds helm-css-scss helm-company goto-chg google-translate golden-ratio gnuplot gntp gitignore-mode gitconfig-mode git-gutter-fringe+ git-gutter gh-md flyspell-correct-helm flycheck-pos-tip flycheck-ledger flx-ido fill-column-indicator fancy-battery eyebrowse evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-args eshell-prompt-extras esh-help emmet-mode elisp-slime-nav edn dumb-jump diminish diff-hl define-word cython-mode company-web company-tern company-anaconda coffee-mode clojure-snippets clean-aindent-mode cider-eval-sexp-fu bind-key auto-yasnippet auto-highlight-symbol auto-dictionary anzu adaptive-wrap ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
