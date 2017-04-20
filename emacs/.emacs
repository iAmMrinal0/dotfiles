(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(package-selected-packages
   (quote
    (xref-js2 system-packages helm-flx helm-fuzzier spacemacs-theme highlight-numbers color-identifiers-mode arch-packer pacmacs smartparens zpresent nodejs-repl xkcd window-numbering web-mode use-package undo-tree spinner smart-mode-line-powerline-theme rainbow-mode py-autopep8 projectile pdf-tools org-bullets multiple-cursors magit js-comint jedi ido-vertical-mode helm haskell-mode git-timemachine git-gutter free-keys flycheck flx-ido expand-region emojify elpy dracula-theme company-tern base16-theme anzu ag ac-js2))))
;;  '(vc-annotate-background "#181e26")
;;  '(vc-annotate-color-map
;;    (quote
;;     ((20 . "#98be65")
;;      (40 . "#ffff00")
;;      (60 . "#ffff00")
;;      (80 . "#ECBE7B")
;;      (100 . "#ffff00")
;;      (120 . "#ffff00")
;;      (140 . "#da8548")
;;      (160 . "#ffaa55")
;;      (180 . "#ff55aa")
;;      (200 . "#c678dd")
;;      (220 . "#ff00aa")
;;      (240 . "#ff0055")
;;      (260 . "#ff6c6b")
;;      (280 . "#bf0000")
;;      (300 . "#7f0000")
;;      (320 . "#3f0000")
;;      (340 . "#525252")
;;      (360 . "#525252"))))
;;  '(vc-annotate-very-old-color nil))
;; '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
;; '(highlight-tail-colors
;;   (quote
;;    (("#3C3D37" . 0)
;;     ("#679A01" . 20)
;;     ("#4BBEAE" . 30)
;;     ("#1DB4D0" . 50)
;;     ("#9A8F21" . 60)
;;     ("#A75B00" . 70)
;;     ("#F309DF" . 85)
;;     ("#3C3D37" . 100))))
'(magit-diff-use-overlays nil)
'(org-agenda-files (quote ("~/geekskool/js/clean.org")))
;; '(pos-tip-background-color "#A6E22E")
;; '(pos-tip-foreground-color "#272822")
'(python-shell-interpreter "python3")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; GUI and other settings
(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (with-selected-frame frame
                (load-theme 'dracula t))))
    (load-theme 'dracula t))
(add-to-list 'auto-mode-alist '("\\.cl\\'" . (lambda () (setq-local require-final-newline t))))
(column-number-mode 1)
(define-fringe-bitmap 'tilde [0 0 0 113 219 142 0 0] nil nil 'center)
(delete-selection-mode 1)
(desktop-save-mode 1)
(electric-pair-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)
(global-hl-line-mode t)
(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
(global-visual-line-mode)
(menu-bar-mode -1)
(set-fringe-bitmap-face 'tilde 'font-lock-comment-face)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setcdr (assq 'empty-line fringe-indicator-alist) 'tilde)
(setq vc-follow-symlinks t)
(setq set-mark-command-repeat-pop t)
(setq load-prefer-newer t)
(setq make-backup-files nil)
(setq-default cursor-type 'bar)
(setq-default indent-tabs-mode nil)
(setq-default indicate-empty-lines t)
(setq inhibit-splash-screen t)
(setq auto-revert-check-vc-info t)
(setq large-file-warning-threshold 100000000)
;; (setq kill-whole-line t)
(blink-cursor-mode -1)
(show-paren-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (set-face-attribute 'default nil
;;                     :family "Source Code Pro"
;;                     :foundry "ADBO"
;;                     :height 105
;;                     :weight 'normal
;;                     :width 'normal)

(setq default-frame-alist
      (append '((font . "-ADBO-Source Code Pro-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
              default-frame-alist))

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
;; (defun remove-scratch-buffer ()
;;   (if (get-buffer "*scratch*")
;;       (kill-buffer "*scratch*")))
;; (add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
;; (setq-default message-log-max nil)
;; (kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
;; (add-hook 'minibuffer-exit-hook
;;           '(lambda ()
;;              (let ((buffer "*Completions*"))
;;                (and (get-buffer buffer)
;;                     (kill-buffer buffer)))))

;; Removes *buffer-completion* from buffer
;; (add-hook 'minibuffer-exit-hook
;;           '(lambda ()
;;              (let ((buffer "*buffer-selection*"))
;;                (and (get-buffer buffer)
;;                     (kill-buffer buffer)))))


;; Don't show *Buffer list* when opening multiple files at the same time.
;; (setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
;; (add-hook 'window-setup-hook 'delete-other-windows)

;; disable arrow keys, cause I like to watch the world burn
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))
(global-unset-key (kbd "<C-left>"))
(global-unset-key (kbd "<C-right>"))
(global-unset-key (kbd "<C-up>"))
(global-unset-key (kbd "<C-down>"))
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-unset-key (kbd "<M-up>"))
(global-unset-key (kbd "<M-down>"))

;; package initializations
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(diminish 'visual-line-mode "")

(use-package ag
  :ensure t)

(use-package anzu
  :ensure t
  :diminish anzu-mode
  :init
  (global-anzu-mode t))

(use-package auto-complete
  :ensure t
  :init
  (global-auto-complete-mode t)
  (ac-config-default))

(use-package bs
  :bind
  ("M-g M-b" . bs-show))

(use-package color-identifiers-mode
  :ensure t
  :diminish (color-identifiers-mode)
  :init
  (color-identifiers-mode))

;; company backend for tern
;; http://ternjs.net/doc/manual.html#emacs
(use-package company-tern
  :ensure t
  :defer t
  :diminish (company-mode))

;; Picked from Chillar Anand
(use-package desktop
  :config
  (setq desktop-dirname             "~/.emacs.d/desktop/"
        desktop-base-file-name      "emacs.desktop"
        desktop-base-lock-name      "lock"
        desktop-path                (list desktop-dirname)
        desktop-save                t
        desktop-files-not-to-save   "^$"  ;reload tramp paths
        desktop-load-locked-desktop t)
  (desktop-save-mode 1))

(use-package elpy
  :ensure t
  :defer t
  :config
  (elpy-enable))

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region))

(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1)
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(use-package flycheck
  :ensure t
  :defer t
  :init (global-flycheck-mode))

(use-package flyspell
  :mode ("'\\.md\\'" . flyspell-mode))

(use-package free-keys
  :ensure t)

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :defer t
  :init (global-git-gutter-mode 1)
  :config
  (setq git-gutter:added-sign "++")
  (setq git-gutter:deleted-sign "--")
  (setq git-gutter:modified-sign "  ")
  (setq git-gutter:update-interval 1)
  (set-face-background 'git-gutter:modified "#a36fff")
  (set-face-foreground 'git-gutter:added "#198844")
  (set-face-foreground 'git-gutter:deleted "#cc342b")
  (add-to-list 'git-gutter:update-hooks 'focus-in-hook)
  (add-hook 'git-gutter:update-hooks 'magit-after-revert-hook)
  (add-hook 'git-gutter:update-hooks 'magit-not-reverted-hook))

(use-package git-timemachine
  :ensure t
  :bind
  ("C-x C-g" . git-timemachine))

(use-package helm
  :ensure t
  :diminish (helm-mode)
  :bind
  ("M-g M-m" . helm-global-mark-ring)
  ("M-x" . helm-M-x)
  ("M-y" . helm-show-kill-ring)
  :init
  (setq helm-M-x-fuzzy-match                  t)
  ;;       helm-bookmark-show-location           t
  ;;       helm-buffers-fuzzy-matching           t
  ;;       helm-completion-in-region-fuzzy-match t
  ;;       helm-file-cache-fuzzy-match           t
  ;;       helm-imenu-fuzzy-match                t
  ;;       helm-mode-fuzzy-match                 t
  ;;       helm-locate-fuzzy-match               t
  ;;       helm-quick-update                     t
  ;;       helm-recentf-fuzzy-match              t
  ;;       helm-semantic-fuzzy-match             t)
  (require 'helm-config)
  (helm-mode 1))

;; (use-package helm-flx
;;   :ensure t
;;   :init
;;   (helm-flx-mode +1))

;; (use-package helm-fuzzier
;;   :ensure t
;;   :init
;;   (helm-fuzzier-mode 1))

(use-package ido
  :ensure t
  :init
  (ido-mode 1)
  (setq ido-everywhere 1))

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p))

(use-package jedi
  :ensure t
  :defer t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :init
  (setq js2-include-node-externs t)
  (setq js2-basic-offset 2)
  (setq js-indent-level 2)
  (setq js2-strict-missing-semi-warning nil)
  (setq js-switch-indent-offset 2))

(use-package js2-refactor
  :ensure t
  :diminish (js2-refactor-mode)
  :defer t
  :config
  (js2r-add-keybindings-with-prefix "C-c C-m")
  (add-hook 'js2-mode-hook 'js2-refactor-mode))

(use-package js-comint
  :ensure t
  :init
  (setq inferior-js-program-command "node")
  (setq inferior-js-program-arguments '("--interactive"))
  (add-hook 'js2-mode-hook
            (lambda ()
              (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
              (local-set-key (kbd "C-M-x") 'js-send-last-sexp-and-go)
              (local-set-key (kbd "C-c b") 'js-send-buffer)
              (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)
              (local-set-key (kbd "C-c l") 'js-load-file-and-go))))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  :config
  (setq magit-commit-arguments (quote ("--gpg-sign=E27C4BC509095144"))))

(use-package markdown-mode
  :ensure t
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode ("\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package mpc
  :bind
  ("C-x M-m" . mpc)
  :config
  (setq mpc-browser-tags (quote (Album|Playlist))))

(use-package multiple-cursors
  :ensure t
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

(use-package org
  :ensure t
  :defer t
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  :config
  (setq org-log-done t)
  (setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "CANCELLED" "DONE"))))

(use-package org-bullets
  :ensure t
  :init
  (setq org-bullets-bullet-list '("●"))
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package pdf-tools
  :ensure t
  :init
  (pdf-tools-install))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init
  (projectile-mode))

(use-package py-autopep8
  :ensure t
  :defer t
  :init
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

(use-package rainbow-mode
  :ensure t
  :diminish rainbow-mode
  :init
  (rainbow-mode t))

;; (use-package color-theme-sanityinc-tomorrow
;;   :ensure t
;;   :config
;;   (load-theme 'sanityinc-tomorrow-night t))

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/theme 'dark)
  (setq sml/mode-width 'full)
  (setq sml/name-width 10)
  (sml/setup))

;; (use-package smart-mode-line-powerline-theme
;;   :ensure t)

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  :bind
  ("C-z" . undo)
  ("C-S-z" . undo-tree-redo))

(use-package uniquify
  :config
   (setq uniquify-buffer-name-style 'forward)
   (setq uniquify-separator "/")
   (setq uniquify-after-kill-buffer-p t)
   (setq uniquify-ignore-buffers-re "^\\*"))

(use-package web-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))
  :config
  (setq-default indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-script-padding 0)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-auto-pairing nil)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))

(use-package window-numbering
  :ensure t
  :init
  (window-numbering-mode))

(use-package yasnippet
  :ensure t
  :defer t
  :diminish (yas-minor-mode)
  :init
  (yas-global-mode 1))

(use-package tern
  :diminish (tern-mode)
  :config
  (defun my-js-mode-hook ()
    "Hook for `js-mode'."
    (set (make-local-variable 'company-backends)
         '((company-tern company-files))))
  (add-hook 'js2-mode-hook 'my-js-mode-hook)
  (add-hook 'js2-mode-hook 'company-mode)
  (add-hook 'js2-mode-hook 'tern-mode))

;; company backend for tern
;; http://ternjs.net/doc/manual.html#emacs
(use-package company-tern
  :ensure t
  :diminish (company-mode))
