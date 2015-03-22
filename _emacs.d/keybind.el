; keybind.el
; Special key binding code.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Global key bindings.

;; Set C-cC-g to globaly do goto-line.
(global-set-key "\C-c\C-g" 'goto-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Mode specific key bindings

; Disable goto-line mapping for org-mode.
; DOESN'T WORK, as the global binding overrides. 
(add-hook 'org-mode-hook
  '(lambda ()
     (local-unset-key "\C-c\C-g")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Example code

;; Example of remaping a key for a specific mode. emacs FAQ 113. You often
;; want to do this with a hook, especially if you are dependent upon having
;; a key map available because many modes create their key maps upon startup
;; so they aren't normally available. This remaps ESC RET (or M-RET) to
;; call shell-resynch-dirs

; (add-hook 'shell-mode-hook
;   '(lambda ()
;      (local-set-key "" (quote shell-resync-dirs))))
