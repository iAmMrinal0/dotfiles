(require 'server)
(unless (server-running-p)
  (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-google-dark)))
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" default)))
 '(package-selected-packages
   (quote
    (markdown-preview-mode yasnippet-bundle web-mode undo-tree smart-mode-line py-autopep8 projectile org-bullets neotree magit jedi git-gutter flycheck flx-ido emojify elpy base16-theme anzu use-package)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "unknown" :slant normal :weight normal :height 105 :width normal))))
 '(trailing-whitespace ((t (:background "dim gray")))))


;; GUI and other settings
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
(set-fringe-bitmap-face 'tilde 'font-lock-comment-face)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setcdr (assq 'empty-line fringe-indicator-alist) 'tilde)
(setq make-backup-files nil)
(setq-default cursor-type 'bar)
(setq-default indicate-empty-lines t)
(setq inhibit-splash-screen t)
(show-paren-mode 1)
(tool-bar-mode -1)


;; pakcage initializations
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


(use-package ac-js2
  :ensure t
  :init
  (add-hook 'js2-mode-hook 'ac-js2-mode)
  :config
  (setq ac-js2-evaluate-calls t))

(use-package anzu
  :ensure t
  :diminish anzu-mode
  :init
  (global-anzu-mode t))

(use-package auto-complete
  :ensure t
  :init
  (ac-config-default))

(use-package base16-theme
  :ensure t
  :init
  (load-theme 'base16-google-dark))

(use-package bs
  :bind
  ("<f5>" . bs-show))

(use-package elpy
  :ensure t
  :defer t
  :config
  (elpy-enable))

(use-package emojify
  :ensure t
  :init
  (global-emojify-mode))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

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
  (set-face-background 'git-gutter:modified "#a36ac7")
  (set-face-foreground 'git-gutter:added "#198844")
  (set-face-foreground 'git-gutter:deleted "#cc342b")
  (add-to-list 'git-gutter:update-hooks 'focus-in-hook)
  (add-hook 'git-gutter:update-hooks 'magit-after-revert-hook)
  (add-hook 'git-gutter:update-hooks 'magit-not-reverted-hook))

;; (use-package haskell-mode
;;   :ensure t
;;   :config
;;   (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
;;   (add-hook 'haskell-mode-hook 'interactive-haskell-mode))

(use-package ido
  :ensure t
  :init
  (ido-mode 1)
  (setq ido-everywhere 1))

;; (use-package intero
;;   :ensure t
;;   :after haskell-mode
;;   :config
;;   (add-hook 'haskell-mode-hook 'intero-mode))

(use-package jedi
  :ensure t
  :defer t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t))

(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  :config
  (setq js2-basic-offset 2)
  (setq js2-strict-missing-semi-warning nil))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status))

(use-package mpc
  :bind
  ("C-x M-m" . mpc)
  :config
  (setq mpc-browser-tags (quote (Album|Playlist))))

(use-package neotree
  :ensure t
  :defer t
  :bind
  ("C->" . neotree-toggle)
  :config
  (setq neo-smart-open t))

(use-package org
  :ensure t
  :defer t
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  :config
  (setq org-log-done t)
  (setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE"))))

(use-package org-bullets
  :ensure t
  :defer t
  :config
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

(use-package smart-mode-line
  :ensure t)

(use-package smart-mode-line-powerline-theme
  :ensure t)

(use-package smart-mode-powerline-theme
  :init
  (setq sml/theme 'powerline)
  (sml/setup))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  :bind
  (("C-z" . undo)
   ("C-S-z" . undo-tree-redo)))

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

(use-package yasnippet
  :ensure t
  :defer t)
