;;
;; NOTE: misc configurations
;;

; case insensitive search
(setq-default case-fold-search t)

; set language environment
(set-language-environment "UTF-8")

; setup backup
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

; disable unncessesary GUI
(tool-bar-mode 0)
(menu-bar-mode 0)

; SPACE >>> TAB
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; see matching parentheses 
(show-paren-mode t)

; remember cursor position
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

; fullscreen when startup
(custom-set-variables
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

; Advance buffer management
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

; show/hide whitespace
(global-set-key (kbd "C-c w") 'whitespace-mode)

; set theme
(setq custom-theme-directory "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path custom-theme-directory)
(load-theme 'solarized-dark t)

; compilation support
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))
