; init.el
; Emacs initialization.


;; do not display a splash screen on startup
(setq inhibit-splash-screen t)


;; Package Manager Setup (from MELPA webpage).

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set the load path  

;; add everything under ~/.emacs.d to it
;; (let* ((my-lisp-dir "~/.emacs.d/")
;;         (default-directory my-lisp-dir))
;;   (setq load-path (cons my-lisp-dir load-path))
;;   (normal-top-level-add-subdirs-to-load-path))


;; Load additional extension/setup files for specific modes/topics.
;; org-mode
;; Custom key bindings
;; Tramp

(load "~/.emacs.d/orgstuff.el" t)
(load "~/.emacs.d/keybind.el" t)
(load "~/.emacs.d/tramp_cust.el" t)
(load "~/.emacs.d/hooks.el" t)

(require 'font-lock)

;; Setup customize file so it doesn't pollute main files.

;; This code is a riff on http://www.emacswiki.org/emacs/EmacsInitFileOfSylecn

;; The default customize file is customize_term.el
(setq custom-file "~/.emacs.d/customize_term.el")
;; Override this if there is a window system present.
(if (equal window-system 'w32)
    (setq custom-file "~/.emacs.d/customize.el")
  (if (equal window-system 'x)
      (setq custom-file "~/.emacs.d/customize_linux.el")
    (if (equal window-system 'ns)
        (setq custom-file "~/.emacs.d/customize_mac.el")
      )
    )
)
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

; Set transient mark mode
(transient-mark-mode t)       

;(setq default-major-mode 'org-mode)


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




