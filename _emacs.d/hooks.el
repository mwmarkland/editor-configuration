;; hooks.el
;; mode hooks

;; Unlike python-mode, this mode follows the Emacs convention of not
;; binding the ENTER key to `newline-and-indent'.  To get this
;; behavior, add the key definition to `yaml-mode-hook':

(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; Make font-lock fontify buffers automatically if they
;; come up in font-lock-mode
(add-hook 'font-lock-mode-hook 'font-lock-fontify-buffer)
(add-hook 'c-mode-common-hook 'turn-on-font-lock)
(add-hook 'lisp-mode-hook 'turn-on-font-lock)
(add-hook 'asm-mode-hook 'turn-on-font-lock)
(add-hook 'm2-mode-hook 'turn-on-font-lock)
(add-hook 'sh-mode-hook 'turn-on-font-lock)
(add-hook 'perl-mode-hook 'turn-on-font-lock)
(add-hook 'compilation-mode-hook 'turn-on-font-lock)
(add-hook 'message-mode-hook 'turn-on-font-lock)
(add-hook 'outline-mode-hook 'turn-on-font-lock)
(add-hook 'makefile-mode-hook 'turn-on-font-lock)
(add-hook 'html-mode-hook 'turn-on-font-lock)
(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'dired-mode-hook 'turn-on-font-lock)
(add-hook 'yaml-mode-hook 'turn-on-font-lock)

;; Make sure that no tabs appear in TeX and LaTeX documents
(add-hook 'tex-mode-hook
          (function (lambda ()
                      (make-local-variable 'indent-tabs-mode)
                      (setq indent-tabs-mode nil))))


(add-hook 'fundamental-mode-hook 'turn-on-auto-fill)

