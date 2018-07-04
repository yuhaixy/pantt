(require 'crux)
(defvar pantt-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c o") 'crux-open-with)
    (define-key map (kbd "C-c s") 'crux-swap-windows)
    map)
  "Keymap for pantt mode.")

;; define minor mode
(define-minor-mode pantt-mode
  "Minor mode to consolidate Emacs pantt extensions.

\\{pantt-mode-map}"
  :lighter " Pre"
  :keymap pantt-mode-map)

(define-globalized-minor-mode pantt-global-mode pantt-mode pantt-on)

(defun pantt-on ()
  "Turn on `pantt-mode'."
  (pantt-mode +1))

(defun pantt-off ()
  "Turn off `pantt-mode'."
  (pantt-mode -1))

(provide 'pantt-mode)
