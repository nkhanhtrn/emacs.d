; load path
(add-to-list 'load-path "~/.emacs.d/config/")
(setq default-directory "~/dev/")

; package manager
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
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
    js-comint
    tern
    tern-auto-complete
    ; TypeScript
    tide
    ; helm
    helm
    helm-gtags
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
    smooth-scrolling
    rainbow-mode
    golden-ratio
    ; theme
    solarized-theme
  ))
(dolist (p nk/elpa-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; mode configuration
(load-library "common")                     ; common settings
(load-library "misc")                       ; misc plugins
(load-library "helm")                       ; helm
(load-library "helm-descbinds")             ; helm-descbinds
(load-library "helm-gtags")                 ; helm-gtags
(load-library "company")                    ; company
(load-library "smartparens")                ; smartparens
(load-library "c-cpp")                      ; c/c++
(load-library "markdown")                   ; markdown
(load-library "webmode")                    ; web-mode
(load-library "javascript")                 ; JavaScript mode
(load-library "typescript")                 ; TypeScript mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (solarized-theme golden-ratio rainbow-mode smooth-scrolling nyan-mode dired-rainbow dired+ dired-details+ markdown-mode lua-mode function-args yasnippet helm-descbinds helm-projectile helm-gtags helm tide tern-auto-complete tern js-comint js2-mode web-mode elisp-slime-nav ws-butler dtrt-indent clean-aindent-mode smartparens sr-speedbar company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
