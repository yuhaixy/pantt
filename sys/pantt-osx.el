
;; On OS X Emacs doesn't use the shell PATH if it's not started from
;; the shell. Let's fix that:
(pantt-require-packages '(exec-path-from-shell))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; It's all in the Meta
(setq ns-function-modifier 'hyper)

(defun pantt-swap-meta-and-super ()
  "Swap the mapping of Meta and Super.
Very useful for people using their Mac with a
Windows external keyboard from time to time."
  (interactive)
  (if (eq mac-command-modifier 'super)
      (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super)
        (message "Command is now bound to META and Option is bound to SUPER."))
    (progn
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta)
      (message "Command is now bound to SUPER and Option is bound to META."))))


;; 需要加入mode支持
;;(define-key pantt-mode-map (kbd "C-c w") 'pantt-swap-meta-and-super)
;;(define-key pantt-mode-map (kbd "s-/") 'hippie-expand)

(menu-bar-mode +1)

;; Enable emoji, and stop the UI from freezing when trying to display them.
(if (fboundp 'set-fontset-font)
    (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))


(provide 'pantt-osx)
