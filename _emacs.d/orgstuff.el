;; org-mode setup file.

;; Thsi comres from the orgmode.org website.
;;(require 'org-install)

;; The following lines are always needed.  Choose your own keys.
;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;;(add-hook 'org-mode-hook 'turn-on-font-lock)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
       '((sequence "TODO(t)" "IN_PROGRESS(!)" "WAITING(@/!)" "|" "DONE(d@/!)" )))
