(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(if (display-graphic-p) (scroll-bar-mode 0))

(menu-bar-mode 0)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " Pantt - " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))
;; title bar format, %b : curr buffer name
(setq frame-title-format "Pantt@%b")

;; 默认buffer
;; 关闭emacs启动画面
(setq inhibit-startup-message t)
;; 关闭GNUS启动画面
(setq gnus-inhibit-startup-message t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
;; delegate theming to the currently active theme
(setq sml/theme nil)
(add-hook 'after-init-hook #'sml/setup)

;; show the cursor when moving after big movements in the window
(require 'beacon)
(beacon-mode +1)

(provide 'pantt-ui)
