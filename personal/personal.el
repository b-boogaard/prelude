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

;; Spell checking on the fly is evil
(setq prelude-flyspell nil)

;; Use bash while in TRAMP - prevent issues between
;; tramp and zsh
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

;; Get a real gutter
(set-window-margins nil 1)

;; Swap Meta and Super (Alt and Command)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Stop with the auto-escaped quotes
(setq sp-autoescape-string-quote nil)

;; Enable clipboard
(setq x-select-enable-clipboard t)

;; emacs shells to not display ascii color codes
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(provide 'personal)
;;; personal.el ends here
