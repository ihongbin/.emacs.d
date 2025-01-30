(setq custom-file "~/.emacs.d/.emacs.custom.el")
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/.emacs.local/")

(load "~/.emacs.d/.emacs.rc/rc.el")

(load-file "~/.emacs.d/.init_font.el")

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode t)
(setq inhibit-startup-screen t)

(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(rc/require-theme 'gruber-darker)

;;; ido
(rc/require 'smex 'ido-completing-read+)
(require 'ido-completing-read+)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; c-mode
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

;;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
             (local-set-key (kbd "C-c C-j")
                            (quote eval-print-last-sexp))))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

;;; multiple cursors
(rc/require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;; dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

;;; helm
(rc/require 'helm 'helm-git-grep 'helm-ls-git)

(setq helm-ff-transformer-show-only-basename nil)

(global-set-key (kbd "C-c h t") 'helm-cmd-t)
(global-set-key (kbd "C-c h g g") 'helm-git-grep)
(global-set-key (kbd "C-c h g l") 'helm-ls-git-ls)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h a") 'helm-org-agenda-files-headings)
(global-set-key (kbd "C-c h r") 'helm-recentf)

;;; Company
(rc/require 'company)
(require 'company)

(global-company-mode)

;;; LaTeX mode
(add-hook 'tex-mode-hook
          (lambda ()
            (interactive)
            (add-to-list 'tex-verbatim-environments "code")))

(setq font-latex-fontify-sectioning 'color)

;;; Move Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; Packages that don't require configuration
(rc/require
 'yaml-mode
 'lua-mode
 'less-css-mode
 'rust-mode
 'csharp-mode
 'markdown-mode
 'dockerfile-mode
 'nginx-mode
 'go-mode
 'php-mode
 'racket-mode
 'typescript-mode
 )

;;(use-package rime
;;  :custom
;;  (default-input-method "rime"))

(load-file custom-file)
