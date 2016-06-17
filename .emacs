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
    ("a802c77b818597cc90e10d56e5b66945c57776f036482a033866f5f506257bca" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" default)))
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "  ")
 '(git-gutter:update-interval 1)
 '(python-shell-interpreter "python3")
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


(use-package anzu
  :ensure t
  :diminish anzu-mode
  :init
  (global-anzu-mode +1))

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
  :init
  (elpy-enable))

(use-package emojify
  :ensure t
  :init
  (global-emojify-mode))

(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1)
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(use-package flycheck
  :ensure t
  :defer t
  :init
  (when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)))

(use-package ido
  :ensure t
  :init
  (ido-mode 1)
  (setq ido-everywhere 1))

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :defer t
  :init (global-git-gutter-mode 1)
  :config
  (set-face-background 'git-gutter:modified "#a36ac7")
  (set-face-foreground 'git-gutter:added "#198844")
  (set-face-foreground 'git-gutter:deleted "#cc342b")
  (add-to-list 'git-gutter:update-hooks 'focus-in-hook)
  (add-hook 'git-gutter:update-hooks 'magit-after-revert-hook)
  (add-hook 'git-gutter:update-hooks 'magit-not-reverted-hook))

(use-package jedi
  :ensure t
  :defer t
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t))

(use-package magit
  :ensure t
  :bind
  ("C-x g" . magit-status))

(use-package neotree
  :ensure t
  :bind
  ("C->" . neotree-toggle)
  :config
  (setq neo-smart-open t))

(use-package org
  :ensure t
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  :config
  (setq org-log-done t)
  (setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE"))))

(use-package org-bullets
  :ensure t
  :config
  (setq org-bullets-bullet-list '("●"))
  (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init
  (projectile-global-mode))

(use-package py-autopep8
  :ensure t
  :defer t
  :init
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package smart-mode-line
  :ensure t)

(use-package smart-mode-powerline-theme
  :init
  (setq powerline-arrow-shape 'arrow)
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
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-js-indent-offset 0)
  (setq web-mode-script-padding 0)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-auto-pairing nil))

(use-package yasnippet
  :ensure t
  :defer t)
