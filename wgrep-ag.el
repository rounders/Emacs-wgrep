;;; wgrep-ag.el --- Writable ag buffer and apply the changes to files

;;; Commentary:

;; wgrep-al allows you to edit a ag buffer and apply those
;; changes to the file buffer.

;;; Install:

;; 1. Install ag.el
;;
;;   https://github.com/Wilfred/ag.el

;; 2. Install wgrep.el

;; 3. Put this file into load-path'ed directory, and byte compile it if
;; desired. And put the following expression into your ~/.emacs.
;;
;;     (require 'wgrep-ag)

;;; Usage:

;; See wgrep.el

;;; Code:

(require 'wgrep)

;;;###autoload
(defun wgrep-ag-setup ()
  (set (make-local-variable 'wgrep-line-file-regexp)
       "^\\(.+?\\)\\(:[ 	]*\\)\\([1-9][0-9]*\\):\\([1-9][0-9]\\)*\\2")
  (wgrep-setup-internal))

(add-hook 'ag-mode-hook 'wgrep-ag-setup)

;; For `unload-feature'
(defun wgrep-ack-unload-function ()
  (remove-hook 'ag-mode-hook 'wgrep-ag-setup))

(provide 'wgrep-ag)

;;; wgrep-ag.el ends here
