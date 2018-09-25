(menu-bar-mode 0)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode nil))
(if (display-graphic-p) (scroll-bar-mode 0))

;; theme
(load-theme 'manoj-dark t)
;; available themes:
;; adwaita caroline firecode leuven manoj-dark wombat zenburn
;;(load-theme 'caroline t)
;;(load-theme 'solarized-dark t)

;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier 'super)


;; shortcuts
(global-set-key "\C-xk" 'kill-this-buffer)
(global-set-key "\C-z" 'set-mark-command)

(global-set-key [(meta g)] 'goto-line)

(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-0") 'delete-window)

(global-set-key "\M-pk" 'kill-buffer-and-window) ;; kill curr win & buffer

(global-set-key "\C-c\ [" 'shrink-window-horizontally)
(global-set-key "\C-c\ ]" 'enlarge-window-horizontally)


;; org-mode config
(setq org-src-fontify-natively t) ;; set org-mode src highlight


;;(require 'all-the-icons)
;;(setq inhibit-compacting-font-caches t)


;; neotree
;;(require 'neotree)
;;(global-set-key [f8] 'neotree-toggle)
;;(setq neo-theme (if (display-graphic-p) 'arrow)) ;;icons

;; 逗号后面加空格
(global-set-key (kbd ",")
                #'(lambda ()
                    (interactive)
                      (insert ", ")))


;; 高亮括号配对
(electric-pair-mode)

;; 高亮括号配对
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; 美化显示符号（elisp），比如lambda会显示为λ
(prettify-symbols-mode)
(global-prettify-symbols-mode 1)


;; org > markdown backend
;;(require 'ox-gfm)
(eval-after-load "org"
  '(require 'ox-gfm nil t))

;; dired

;; 过滤文件
(setq dired-omit-extensions '(".git" ".DS_Store" "~"))


(eval-when-compile (require 'cl))

;; for table align good display 解决表格对齐问题

(defun set-font (english chinese english-size chinese-size)
    (set-face-attribute 'default nil :font
        (format "%s:pixelsize=%d" english english-size))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
            (font-spec :family chinese :size chinese-size))))

(ecase system-type
    (gnu/linux ;; for linux TODO: debug.
        (set-face-bold-p 'bold nil)
        (set-face-underline-p 'bold nil)
        (set-font "monofur" "vera Sans YuanTi Mono" 20 20))
    (darwin ;; for mac ok!
        (set-font "Monaco" "STHeiti" 12 14))
    (windows-nt ;; for win TODO: debug,
        (set-font "Consolas" "Microsoft Yahei" 24 24)))

;; end table align display

(ecase system-type
  (windows-nt
    (setq default-directory "/home/liuyazhuo/")))
