(require 'cl)
(require 'package)

;; windows 只支持http，linux支持https
(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
        '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
    (add-to-list 'package-archives
        '("melpa" . "http://elpa.emacs-china.org/melpa/") t))

;; set package-user-dir to be relative to pantt install path
(setq package-user-dir (expand-file-name "elpa" pantt-dir))

(package-initialize)

(defvar pantt-packages
    `(ace-window
     avy
     anzu
	 beacon
     crux
     dash
	 discover-my-major
	 diminish
     editorconfig
     expand-region
	 projectile
	 smartparens ;; 括号对
         smart-mode-line ;; 漂亮的mode-line
         ox-gfm
         go-mode
         php-mode
         protobuf-mode
         yaml-mode
         json-mode
         markdown-mode
         docker
         docker-compose-mode
         ansible
         nginx-mode
         vagrant
         python-mode
         rust-mode
     monokai-theme
     solarized-theme
     tangotango-theme
     zenburn-theme)
    "package list installed at launch.")

;; firecode-theme
;; zen-and-art-theme yaml-mode
;; tangotango-theme solarized-theme
;; protobuf-mode
;; php-mode
;; naquadah-theme mustard-theme
;; monokai-theme
;; magit json-mode
;; go-mode
;; gitignore-mode gitconfig-mode git-timemachine gist

(defun pantt-packages-installed-p ()
  "Check if all packages in `pantt-packages' are installed."
  (every #'package-installed-p pantt-packages))

(defun pantt-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package pantt-packages)
    (add-to-list 'pantt-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun pantt-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'pantt-require-package packages))

(define-obsolete-function-alias 'pantt-ensure-module-deps 'pantt-require-packages)

(defun pantt-install-packages ()
  "Install all packages listed in `pantt-packages'."
  (unless (pantt-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Pantt is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
      (pantt-require-packages pantt-packages)))

;; run package installation
(pantt-install-packages)

;; file ext >> mode

;; markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
;; php-mode yaml-mode dockerfile-mode scss-mode sass-mode lua-mode json-mode hashkell-mode go-mode feature-mode


(provide 'pantt-packages)
