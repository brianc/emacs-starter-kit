;;*nix specific stuff
(setenv "PATH"
        (concat
         "/home/brian/local/bin:"
         "/home/brian/node_modules/.bin/:"
         "/home/brian/local/node/bin:"
         "/usr/local/bin:"
         (getenv "PATH")))

(setenv "PREFIX" "/home/brian/local")
(setenv "N_PREFIX" "/home/brian/local/n")

(push "/usr/local/bin" exec-path)

(set-frame-position (selected-frame) 40 40)
(set-face-attribute 'default nil :height 150)
(set-frame-height (selected-frame) 40)
(set-frame-width (selected-frame) 150)
(set-frame-parameter (selected-frame) 'cursor-type 'bar)
