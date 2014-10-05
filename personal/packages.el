;;; package --- Summary:

;;; Commentary:

;;; Code:

(package-initialize)
(require 'use-package)

(use-package auto-complete
  :diminish auto-complete-mode
  :init
  (progn
    (add-to-list 'ac-modes 'org-mode)
    (add-to-list 'ac-modes 'js2-mode)
    (global-auto-complete-mode 1)))

(use-package evil
  :pre-load
  :init
  (progn
    (define-key evil-normal-state-map (kbd "C-u") 'scroll-down-command)
    (define-key evil-normal-state-map (kbd ";") 'evil-ex)
    (evil-mode 1)))

(use-package key-chord
  :init
  (progn
    (setq key-chord-two-keys-delay 0.2)
    (key-chord-define-global "jj" nil)
    (key-chord-define-global "jk" nil)
    (key-chord-define-global "jl" nil)
    (key-chord-define-global "uu" nil)
    (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)))

(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode)
  :config
  (ac-js2-mode))

(use-package org
  :defer t
  :config
  (progn
    (use-package org-agenda)
    (use-package org-remember)
    (use-package org-capture)
    (transient-mark-mode t)
    (setq org-deadline-warning-days 7)
    (setq org-timeline-show-empty-dates t)
    (setq org-insert-mode-line-in-empty-file t)
    (add-hook 'capture-mode-hook 'org-remember-apply-template)
    (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/main.org" "Tasks")
         "* TODO %^{Brief Description} %^g\n%?\nAdded: %U")))

    (setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))

    (setq org-agenda-custom-commands
      '(
        ("P" "projects"
         ((tags "project")))

        ("H" "Office and Home Lists"
         ((agenda)
          (tags-todo "work")
          (tags-todo "home")
          (tags-todo "important")))

        ("D" "Daily Action List"
         (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)))))))

    (add-hook 'org-agenda-mode-hook 'hl-line-mode)
    (setq org-default-notes-file (concat org-directory "/notes.org"))
    (define-key global-map "\C-cc" 'org-capture)))

(use-package semantic
  :init
  (progn
    (setq semantic-default-submodes
          '(global-semantic-idle-scheduler-mode
            global-semanticdb-minor-mode
            global-semantic-idle-summary-mode
            global-semantic-mru-bookmark-mode))
    (semantic-mode 1)))

(use-package slime
  :defer t
  :config
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "/usr/local/Cellar/sbcl/1.2.0/bin/sbcl"))

(use-package evil-nerd-commenter
  :defer t)

(use-package multi-term
  :defer t
  :config
  (setq multi-term-program "/usr/local/bin/zsh"))

(provide 'packages)
;;; packages.el ends here
