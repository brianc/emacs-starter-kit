;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit

(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'esk-paredit-nonlisp)
(add-hook 'js-mode-hook 'run-coding-hook)
(setq js-indent-level 2)

(add-hook 'js-mode-hook
          (lambda ()
            (message "js mode")
            (define-key js-mode-map (kbd ",") 'self-insert-command)))

;;nice function
(if window-system
    (font-lock-add-keywords
     'js-mode
     `(("\\(function *\\)("
        (0 (progn (compose-region (match-beginning 1) (match-end 1) "ƒ") nil))))))

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here
