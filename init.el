; load path
(add-to-list 'load-path "~/.emacs.d/config/")
(setq default-directory "~/dev/")

; package manager
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

; autoload packages at start
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar nk/elpa-packages
  '(
    ; IDE plugins
    sr-speedbar
    company
    company-tern
    smartparens
    ; whitespace/indentation
    clean-aindent-mode
    dtrt-indent
    ws-butler
    ; Lisp Mode
    elisp-slime-nav
    ; HTML/CSS/JavaScript
    web-mode
    js2-mode
    js2-refactor
    xref-js2
    js-comint
    tern
    ; TypeScript
    tide
    ; helm
    helm
    helm-projectile
    helm-descbinds
    ; snippet
    yasnippet
    ; C/C++
    function-args
    ; Lua
    lua-mode
    ; Markdown
    markdown-mode
    ; Dired dired-details
    ;dired-details+
    ;dired+
    ;dired-rainbow
    ; misc plugins
    nyan-mode
    rainbow-mode
    golden-ratio
    ; theme
    solarized-theme
  ))
(dolist (p nk/elpa-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; mode configuration
(load-library "nk-common")                     ; common settings
(load-library "nk-misc")                       ; misc plugins
(load-library "nk-helm")                       ; helm
(load-library "nk-company")                    ; company
(load-library "nk-smartparens")                ; smartparens
(load-library "nk-c-cpp")                      ; c/c++
(load-library "nk-markdown")                   ; markdown
(load-library "nk-webmode")                    ; web-mode
(load-library "nk-javascript")                 ; JavaScript mode
(load-library "nk-typescript")                 ; TypeScript mode

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (xref-js2 js2-refactor company-tern solarized-theme golden-ratio rainbow-mode smooth-scrolling nyan-mode dired-rainbow dired+ dired-details+ markdown-mode lua-mode function-args yasnippet helm-descbinds helm-projectile helm tide tern-auto-complete tern js-comint js2-mode web-mode elisp-slime-nav ws-butler dtrt-indent clean-aindent-mode smartparens sr-speedbar company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
