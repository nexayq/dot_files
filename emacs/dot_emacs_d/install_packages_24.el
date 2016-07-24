
;; Install at least Emacs 24, too difficult to install melpa packages on older Emacs (<=23)
    ;; Dont use Emacs 23 (or any <24)
    ; Too difficult to install melpa packages
        ; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/

; Add melpa repositories by running script install_packages.el
    ; C-x C-f ~/.emacs.d/install_packages_24.el
    ; M-x eval-buffer
        ; M-x -> Esc-x
        ; if space doesn't work use 'Esc-space'
        ; restart Emacs

; http://stackoverflow.com/a/31080940/2450748
; https://github.com/melpa/melpa#usage

(require 'package)

;; (add-to-list 'package-archives
             ;; '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

; (add-to-list 'package-archives 
             ; '("marmalade" . "https://marmalade-repo.org/packages/"))

; list the packages you want

(setq package-list
    '(evil  org ox-twbs color-theme-sanityinc-tomorrow
      powerline rainbow-delimiters smooth-scrolling
      neotree dirtree evil-leader ace-window window-numbering
      flycheck helm helm-swoop company evil-org ))

; (setq package-list
    ; '(python-environment deferred epc
        ; flycheck ctable jedi concurrent company cyberpunk-theme elpy
        ; yasnippet pyvenv highlight-indentation find-file-in-project
        ; sql-indent sql exec-path-from-shell iedit
        ; auto-complete popup let-alist magit git-rebase-mode
        ; git-commit-mode minimap popup))


; activate all the packages
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
