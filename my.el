;;cursor config
(blink-cursor-mode)
(set-frame-parameter (selected-frame) 'cursor-type 'bar)

;; file loaded from init.el on every system regardless of account name
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(color-theme-initialize)
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

;;colortheme picker
(setq my-color-themes (list 'color-theme-billw
                            'color-theme-jsc-dark
                            'color-theme-sitaramv-solaris
                            'color-theme-resolve
                            'color-theme-classic
                            'color-theme-jonadabian-slate
                            'color-theme-kingsajz
                            'color-theme-shaman
                            'color-theme-subtle-blue
                            'color-theme-snowish
                            'color-theme-rotor
                            'color-theme-ryerson
                            'color-theme-salmon-diff
                            'color-theme-salmon-font-lock
                            'color-theme-scintilla
                            'color-theme-shaman
                            'color-theme-sitaramv-nt
                            'color-theme-sitaramv-solaris
                            'color-theme-snow
                            'color-theme-snowish
                            'color-theme-standard-ediff
                            'color-theme-standard
                            'color-theme-emacs-21
                            'color-theme-emacs-nw
                            'color-theme-xemacs
                            'color-theme-subtle-blue
                            'color-theme-subtle-hacker
                            'color-theme-taming-mr-arneson ;;nice
                            'color-theme-taylor
                            'color-theme-tty-dark
                            'color-theme-vim-colors
                            'color-theme-whateveryouwant
                            'color-theme-wheat
                            'color-theme-pok-wob
                            'color-theme-pok-wog
                            'color-theme-word-perfect
                            'color-theme-xp
                            'color-theme-sitaramv-nt
                            'color-theme-wheat))

(defun my-theme-set-default ()          ; Set the first row
  (interactive)
  (setq theme-current my-color-themes)
  (funcall (car theme-current)))

(defun my-describe-theme ()             ; Show the current theme
  (interactive)
  (message "%s" (car theme-current)))

                                        ; Set the next theme (fixed by Chris Webber - tanks)
(defun my-theme-cycle ()
  (interactive)
  (setq theme-current (cdr theme-current))
  (if (null theme-current)
      (setq theme-current my-color-themes))
  (funcall (car theme-current))
  (message "%S" (car theme-current)))

(setq theme-current my-color-themes)
(setq color-theme-is-global nil)        ; Initialization
(my-theme-set-default)
(global-set-key [f12] 'my-theme-cycle)
