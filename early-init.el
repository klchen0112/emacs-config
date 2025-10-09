;;; early-init.el --- Early Initialization -*- lexical-binding: t; -*-

(when (getenv "DEBUG") (setq init-file-debug t))
(setq debug-on-error (and (not noninteractive) init-file-debug))

(let ((normal-gc-cons-threshold gc-cons-threshold)
      (normal-gc-cons-percentage gc-cons-percentage)
      (normal-file-name-handler-alist file-name-handler-alist)
      (init-gc-cons-threshold most-positive-fixnum)
      (init-gc-cons-percentage 0.6))
  (setq gc-cons-threshold init-gc-cons-threshold
        gc-cons-percentage init-gc-cons-percentage
        file-name-handler-alist nil)
  (add-hook 'after-init-hook
            `(lambda ()
               (setq gc-cons-threshold ,normal-gc-cons-threshold
                     gc-cons-percentage ,normal-gc-cons-percentage
                     file-name-handler-alist ',normal-file-name-handler-alist))))

(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(setq inhibit-default-init t)
(setq initial-major-mode 'fundamental-mode)

(setq package-enable-at-startup nil)
(setq package-quickstart nil)

(setq use-dialog-box nil)
(push '(undecorated . t) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq frame-inhibit-implied-resize t)
(defvar global-text-scale-adjust-resizes-frames t)

(push '(drag-internal-border . t) default-frame-alist)

(advice-add #'x-apply-session-resources :override #'ignore)

(when (and (fboundp 'native-comp-available-p) (native-comp-available-p))
  (setq native-comp-async-report-warnings-errors nil
        native-comp-deferred-compilation t
        package-native-compile t)
  )
