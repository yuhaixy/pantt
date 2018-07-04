
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar current-user
    (getenv
        (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Pantt booting... Be patient, Master %s!" current-user)

(when (version< emacs-version "24.4")
    (error "Pantt requires at least GNU Emacs 24.4, but you're running %s" emacs-version))

;; Always load newest byte code
(setq load-prefer-newer t)

;; Ruyue root dir
(defvar pantt-dir (file-name-directory load-file-name)
  "Root dir of Emacs Pantt")
(defvar pantt-sys-dir (expand-file-name "sys" pantt-dir)
  "The home of Pantt's sys functionality.")
(defvar pantt-profile-dir (expand-file-name "profiles" pantt-dir)
  "Personal config")
(defvar pantt-var-dir (expand-file-name "var" pantt-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar pantt-savefile-dir (expand-file-name "savefile" pantt-var-dir)
    "This folder stores all the automatically generated save/history-files.")

(unless (file-exists-p pantt-var-dir)
    (make-directory pantt-var-dir))

(unless (file-exists-p pantt-savefile-dir)
    (make-directory pantt-savefile-dir))

(add-to-list 'load-path pantt-sys-dir)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)
;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(message "Pantt sys loading...")

(require 'pantt-packages)
(require 'pantt-ui)
(require 'pantt-util)
(require 'pantt-mode)
(require 'pantt-editor)
(require 'pantt-keybindings)

;; OSX specific settings
(when (eq system-type 'darwin)
  (require 'pantt-osx))
(message "Pantt sys loaded...")
;;;;;;;;;;;;
;; other
;;;;;;;;;;;;

;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" pantt-var-dir))

 ;; load the personal settings (this includes `custom-file')
 (when (file-exists-p pantt-profile-dir)
   (message "Loading personal configuration files in %s..." pantt-profile-dir)
   (mapc 'load (directory-files pantt-profile-dir 't "^[^#\.].*el$")))

 (message "Pantt is ready, Master %s!" current-user)

 ;; Patch security ≈ in Emacs versions older than 25.3
 (when (version< emacs-version "25.3")
   (eval-after-load "enriched"
     '(defun enriched-decode-display-prop (start end &optional param)
        (list start end))))

;; init.el end
