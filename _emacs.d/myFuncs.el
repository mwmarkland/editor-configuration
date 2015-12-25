;; From Emacs Wiki
(defun dos2unix ()
  "Not exactly, but easier to remember."
  (interactive)
  (set-buffer-file-coding-system 'unix' 't) )
