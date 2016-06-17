;; tramp customizations.

;; Basic idea is from emacs wiki. I'm trying to make it
;; machine specific by checking the window system.

(if (equal window-system 'ns)
    (setq tramp-defaul-method "ssh")
  )
