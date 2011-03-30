(require 'font-lock)
(defun sig-ws-tab-width 2)

(defun sig-ws-previous-indentation ()
  "Gets indentation for previous line"
  (save-excursion
    (previous-line)
    (current-indentation)))

(defun sig-ws-line-as-string ()
  "Returns the line as a string"
  `(buffer-substring (point-at-bol) (point-at-eol)))

(defun sig-ws-should-indent-p ()
  "Whether or not line should be indented"
  (> (sig-ws-previous-indentation) (- (current-indentation) 1)))

(defun sig-ws-empty-line-p ()
  "Whether line is empty or not"
  (= (point-at-eol) (point-at-bol)))

(defun sig-ws-blank-line-p ()
  "Whether line is blank (only whitespace) or not"
  (string-match-p "^[ ]*$" (sig-ws-line-as-string)))

(defun sig-ws-indent-line ()
  "Indents a line with consideration for significant whitespace"
  (interactive)
  ;; indents straight to end on empty line
  (if (sig-ws-empty-line-p)
      (indent-to (sig-ws-previous-indentation))
    ))
