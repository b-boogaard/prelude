;;; package --- Summary:
;;; Commentary:

;;; Code:

;; Solarized is not evil
(load-theme 'solarized-dark t)

;; Tabs are evil
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Bells are evil
(setq visible-bell t)

;; Use bash while in TRAMP - prevent issues between
;; tramp and zsh
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

;; Swap Meta and Super (Alt and Command)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Enable clipboard
(setq x-select-enable-clipboard t)

;; emacs shells to not display ascii color codes
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(provide 'personal)
;;; personal.el ends here
