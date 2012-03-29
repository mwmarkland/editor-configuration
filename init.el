; init.el
; Emacs initialization.

;; do not display a splash screen on startup
(setq inhibit-splash-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set the load path  

;; add everything under ~/.emacs.d to it
;; (let* ((my-lisp-dir "~/.emacs.d/")
;;         (default-directory my-lisp-dir))
;;   (setq load-path (cons my-lisp-dir load-path))
;;   (normal-top-level-add-subdirs-to-load-path))


;; Load additional extension/setup for org-mode
(load "~/.emacs.d/orgstuff.el" t)
(load "~/.emacs.d/keybind.el" t)

;; Setup customize file so it doesn't pollute main files.
(setq custom-file "~/.emacs.d/customize.el")
(load-file custom-file)

; Set it up so that vertically split windows don't truncate the lines
; Rather they wrap lines. (From comp.emacs)
(setq truncate-partial-width-window nil)

; Some font-lock things
(setq-default font-lock-auto-fontify t)
(setq-default font-lock-use-fonts nil)
(setq-default font-lock-use-colors t)
(setq-default font-lock-use-maximal-decoration t)
(setq global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(require 'font-lock)
; Make font-lock fontify buffers automatically if they
; come up in font-lock-mode
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

; Set transient mark mode
(transient-mark-mode t)       

; Make sure that no tabs appear in TeX and LaTeX documents
(add-hook 'tex-mode-hook
          (function (lambda ()
                      (make-local-variable 'indent-tabs-mode)
                      (setq indent-tabs-mode nil))))

(setq default-major-mode 'org-mode)

(add-hook 'fundamental-mode-hook 'turn-on-auto-fill)

;; Modifying the style of C/C++ indentation to do case statements and access
;; specifiers more close to the way I like.

(c-add-style "mwm"
     '("gnu"
       (c-offsets-alist . ((case-label . +)
   (access-label . /))
       )) nil)
                       
;; GNU Emacs seems to need this and it doesn't hurt my XEmacs stuff.
(setq c-default-style "mwm")

;; Make it so that indentation is done with spaces rather than tabs.
(setq-default indent-tabs-mode 'nil)


