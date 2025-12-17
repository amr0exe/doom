
;; Main editing font
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 20))
(require 'nerd-icons)

(setq doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 22))
(setq doom-symbol-font (font-spec :family "Iosevka Nerd Font" :size 20))
(setq doom-unicode-font (font-spec :family "Iosevka Nerd Font" :size 20))

;; Force Iosevka Nerd Font for ALL symbols/icons
(set-fontset-font t 'symbol (font-spec :family "Iosevka Nerd Font") nil 'prepend)
(set-fontset-font t 'emoji  (font-spec :family "Iosevka Nerd Font") nil 'prepend)
(set-fontset-font t 'unicode (font-spec :family "Iosevka Nerd Font") nil 'prepend)


(setq display-line-numbers-type nil)

(setq-default left-margin-width 2)
(add-hook 'window-setup-hook #'(lambda () (walk-windows (lambda (w) (set-window-margins w 2)))))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory (file-truename "~/org/roam"))
(org-roam-db-autosync-mode)


(use-package! org-roam
  :ensure t)

(use-package! org-roam-ui
  :after org-roam
  :config
  ;; Opens a live graph view with M-x org-roam-ui-open
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t))

(setq initial-frame-alist '((fullscreen . fullboth)))

;; tabs indent part
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(add-hook 'before-save-hook #'my/untabify-buffer-maybe)


;; blur ;; closer to 1 -> more clear/transparent screen
(add-to-list 'default-frame-alist '(alpha-background . 95))

;; remove little lsp-hover infos
(after! eldoc
  (global-eldoc-mode -1)
  (setq eldoc-message-function #'ignore))

(remove-hook 'prog-mode-hook #'eldoc-mode)
(global-eldoc-mode)

(use-package! org-modern
  :after org
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("●" "○" "✸" "✿")
        org-modern-list '((42 . "◦") (43 . "•") (45 . "–"))
        org-modern-tag t
        org-modern-priority t
        org-modern-timestamp t
        org-modern-todo t
        org-modern-table t))

;; jj mapping
(after! evil
  (setq evil-escape-key-sequence "jj"
        evil-escape-delay 0.2)
  (evil-escape-mode 1))
