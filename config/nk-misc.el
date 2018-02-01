;;
;; PACKAGE: misc plugins
;;

; PACKAGE: clean-aindent-mode
; Usage: clear auto-indent whitespace while editing code
(require 'clean-aindent-mode)
(global-set-key (kbd "RET") 'newline-and-indent)
(set 'clean-aindent-is-simple-indent t)

; PACKAGE: ws-butler
; Usage: remove noisy whitespace
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

; PACKAGE: nyan-mode
; Usage: fancy nyan cat
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)

; PACKAGE: yasnippet
; Usage: snippet
(require 'yasnippet)
(yas-global-mode 1)

; PACKAGE: golden-ratio
; Usage: divide buffers
(require 'golden-ratio)
(setq golden-ratio-auto-scale t)
(golden-ratio-mode 1)
