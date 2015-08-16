(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))j

(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))
