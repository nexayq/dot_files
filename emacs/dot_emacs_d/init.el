;; Great init.el files
    ; https://github.com/hrs/dotfiles/blob/master/emacs.d/configuration.org

;; Emacs shortcuts
    ;; C-x C-s - save file (:w)
    ;; C-x C-c - close emacs (:qa)
    ;; C-x C-c - close emacs (:qa)
    ;; C-x 0 - close current buffer
    ;; C-s - search forward (/)
    ;;       keep pressing C-s for next match
    ;; C-r - search backward (?)
    ;; F10 - Select toolbar (File, Edit, ...)
    ;; C-g - Cancel
;; org-mode
    ;; C-c C-c - Update [X], [/], [%] percentage TODO and checkboxes
    ;; C-c C-e - Export to some format (html, latex, pdf, ...)

;; Meta-x
    ;; Instead of "Alt+x" this is on my PC "Esc+x"

;; Install at least Emacs 24, too difficult to install melpa packages on Emacs
    ;; Install on Ubuntu
        ; sudo add-apt-repository ppa:ubuntu-elisp/ppa
        ; sudo apt-get update
        ; sudo apt-get install emacs-snapshot emacs-snapshot-el
            ; http://askubuntu.com/a/365920/242730

;; set color theme, no startup screen
    ;; :customize-themes - change color theme

;; org-mode
    ; Ignore underscores
        (setq org-export-with-sub-superscripts nil)
            ; http://stackoverflow.com/a/701201/2450748

    ; Indent sub tasks, dont use multiple ***
        ; org-mode-indent
        ; http://orgmode.org/manual/Clean-view.html

    ; Allow export to markdown and beamer (for presentations).
    ; ### Packages ###
    ; ox-twbs - Twitter Bootstrap
        ; Run export to HTML TWBS
            ; :org-twbs-export-to-html
        ; https://github.com/marsmining/ox-twbs
; (when
    ; (load
     ; (expand-file-name "~/.emacs.d/elpa/package.el"))
  ; (package-initialize))

        (when (>= emacs-major-version 24)
            (require 'ox-md))
        (when (>= emacs-major-version 24)
            (require 'ox-beamer))
            ; https://github.com/hrs/dotfiles/blob/master/emacs.d/configuration.org
    ; dont show my info in footer
        (setq org-html-postamble nil)
            ; https://github.com/hrs/dotfiles/blob/master/emacs.d/configuration.org
    ; load languages
         ; (org-babel-do-load-languages
           ; 'org-babel-load-languages
           ; '((emacs-lisp . t)
             ; (ruby . t)
             ; (dot . t)
             ; (gnuplot . t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (ox-twbs smooth-scrolling rainbow-delimiters powerline evil color-theme-sanityinc-tomorrow))))

;; set font DejaVu Sans

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))


;; Add melpa packages
    (require 'package)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
    (package-initialize)

;;;;;;;;;;;;;;;;;; Packages ;;;;;;;;;;;;;;;;;;;;
;; Show all packages
    ;; :list-packages (M-x instead of : in non evil mode)
    ;; i - mark for installation
    ;; x - do selected operations
    ;; d - mark for deleting/removal
    ;; u - mark for update

;; Enable evil mode - evil
    ;; Use ":" instead of "M-x"
        ;; https://www.reddit.com/r/emacs/comments/41760i/meta_doesnt_work_in_evil_mode_mac_emacs/cz08x9q?st=iqwpzs42&sh=3875bd5e
    (require 'evil)
    (evil-mode 1)

;; Color theme - color-theme-sanityinc-tomorrow
    ; (require 'tangotango)
    ; (load-theme 'tangotango t)
    ;; Different color themes for GUI and terminal
    (if (display-graphic-p)
        (progn
            (require 'color-theme-sanityinc-tomorrow)
            (load-theme 'sanityinc-tomorrow-bright))
        (load-theme 'wombat))
    ; (load-theme 'wombat)
    ; (add-hook 'org-mode-hook 'color-theme-sanityinc-tomorrow)

;; Powerline - powerline_evil
    (require 'powerline)
    ; (powerline-default-theme)
    (powerline-vim-theme)

;; Rainbow parenthesis - rainbow-delimiters
    (require 'rainbow-delimiters)
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Smooth scrolling
    (require 'smooth-scrolling)
    (setq scroll-margin 5
        scroll-conservatively 9999
        scroll-step 1)

;;;;;;;;;;;;;;;;;; /Packages ;;;;;;;;;;;;;;;;;;;;

    ;; remap / to /\c - no need, emacs search case insensitive great
    ;; (define-key evil-operator-state-map "w" "iw")

;; Show line numbers
    (global-linum-mode t)
    ;; Show line numbers separated in terminal
    (if (not (display-graphic-p))
        (setq linum-format "%3d "))
    ; (setq linum-format "%3d ")

    ; (setq linum-format "%3d")

;; Start maximized

        ;; http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/

;; Tabs to spaces
    (setq-default tab-width 4 indent-tabs-mode nil)
    (setq-default tab-width 4)
        ;; http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/

;; Autoindent next line
    (define-key global-map (kbd "RET") 'newline-and-indent)

;; Show matching parenthesis
    (show-paren-mode t)

;; Dont create backup files
    (setq make-backup-files nil)

;; Remember cursor position of saved file
    (setq save-place-file "~/.emacs.d/saveplace")
    (setq-default save-place t)
    (require 'saveplace)

;; Toggle whitespace
    (defun nk-toggle-show-trailing-whitespace ()
      "Toggle show-trailing-whitespace between t and nil"
      (interactive)
      (setq show-trailing-whitespace (not show-trailing-whitespace)))

;; Launch terminal from emacs
    ; :shell (M-x shell)

;; Launch emacs from terminal
    ; export TERM=xterm-256color
    ; emacs24 -nw
        ; problems with colors and tmux

;; Indent/unindent lines
    ; Select multiply lines, then type C-u 8 C-x Tab, it will indent the region by 8 spaces.

    ; C-u -4 C-x Tab will un-indent by 4 spaces
        ; http://stackoverflow.com/a/11713860/2450748

;; Show relative line numbers - need package 'linum-relative'
    ; (linum-mode)
    ; (linum-relative-global-mode)
