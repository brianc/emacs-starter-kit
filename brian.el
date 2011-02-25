;;*nix specific stuff
(setenv "PATH"
        (concat
         "/usr/local/bin:"
         (getenv "PATH")))

(push "/usr/local/bin" exec-path)

(if window-system
    (lambda ()((set-frame-position (selected-frame) 40 40)
          (set-face-attribute 'default nil :height 170)
          (set-frame-height (selected-frame) 40)
          (set-frame-width (selected-frame) 150)
          (set-frame-parameter (selected-frame) 'cursor-type 'bar))))
