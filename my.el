;;cursor config
(blink-cursor-mode)
(set-frame-parameter (selected-frame) 'cursor-type 'bar)

;; file loaded from init.el on every system regardless of account name
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

(if window-system (color-theme-zenburn))

;; hooray hippie-expand
(setq hippie-expand-try-functions-list (cons 'yas/hippie-try-expand hippie-expand-try-functions-list))
(global-set-key [(control tab)] 'hippie-expand)

;;F5 for hard refresh of buffer from disk
(global-set-key [f5] (lambda () (interactive) (revert-buffer nil t)))

;;C-Return for nice tabbed return goodness
(global-set-key
 (quote [(control return)])
 (lambda ()
   (interactive)
   (newline-and-indent)
   (newline-and-indent)
   (previous-line)
   (indent-according-to-mode)))

;;.org uses org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; rcirc config
(add-hook 'rcirc-mode-hook
          (lambda ()
            (flyspell-mode 1)
            (rcirc-track-minor-mode 1)))
(setq rcirc-default-nick "brianc")

(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(require 'mustache-mode)
