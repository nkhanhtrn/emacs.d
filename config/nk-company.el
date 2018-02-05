;
; PACKAGE: company
;
; NOTE

(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-tern))

























