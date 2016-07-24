;; Great init.el files
    ; https://github.com/gopar/.emacs.d/blob/master/init.el
    ; https://github.com/aaronbieber/dotfiles/tree/master/configs/emacs.d
    ; https://github.com/hrs/dotfiles/blob/master/emacs.d/configuration.org
    ; https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-evil.el

;; Run in terminal
    ; > emacs -nw
        ; or
    ; > emacs24 -nw
        ; slower than vim

;; Edit files as root, uses builtin TrampMode
    ; C-x C-f /sudo::/etc/hosts
        ; https://www.emacswiki.org/emacs/TrampMode

;; Edit remote files
    ; C-x C-f /ssh:user@192.168.2.1

  ; Open remote shell
    ; M-x shell
        ; https://www.youtube.com/watch?v=vUfkLNC_E1Q

;; Evaluate emacs lisp files
    ; Evalute buffer
        ; :eval-buffer

    ; Evalute current line
        ; C-x C-e

    ; Evalute text region
        ; :eval-region

;; Emacs shortcuts
  ;; get help for key
      ;; C-h k
  ;; get help for function
      ;; C-h f

    ;; C-x o - go to next window
    ;; C-x 0 - close current window
    ;; C-x 1 - zoom(show only) current window
        ;; https://blasphemousbits.wordpress.com/2007/05/04/learning-emacs-part-4-buffers-windows-and-frames/
    ;; C-x C-s - save file (:w)
    ;; C-x C-c - close emacs (:qa)
    ;; C-x C-c - close emacs (:qa)
    ;; C-s - search forward (/)
    ;;       keep pressing C-s for next match
    ;; C-r - search backward (?)
    ;; F10 - Select toolbar (File, Edit, ...)
    ;; C-g - Cancel
    ;; C-x } - Resize split horizontally
        ;; https://ftp.gnu.org/old-gnu/Manuals/emacs-20.7/html_chapter/emacs_20.html
    ;; C-u 10 C-x } - Resize 10 times split horizontally
    ;; C-x z - Repeat last command
        ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Repeating.html
    ;; C-x C-+ - Zoom in, enlarge (bigger) fonts, - to reduce fonts
    ;; C-x C-0 - Reset zoom, reset font size
        ;; http://stackoverflow.com/a/5533251/2450748

;; org-mode
    ;; Link to file [[~/.tmp.txt]]
        ; [[~/tmp.txt]]

    ;; Shift-<up/down> - Set priority to [#A], [#B], [#C] or no priority

    ;; C-c C-c - Update [X], [/], [%] percentage TODO and checkboxes

    ;; C-c C-e - Export to some format (html, latex, pdf, ...)

;; Meta-x
    ;; Instead of "Alt+x" this is on my PC "Esc+x"

;; Dont use Emacs 23 (or any <24)
    ; Too difficult to install melpa packages
        ; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/

;; Install at least Emacs 24, too difficult to install melpa packages on older Emacs (<=23)
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
    (dirtree neotree ox-twbs smooth-scrolling rainbow-delimiters powerline evil color-theme-sanityinc-tomorrow))))

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

    ; Fix for org mode in terminal
    (setq evil-want-C-i-jump nil)
        ; http://stackoverflow.com/a/22922161/2450748
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
    ; (powerline-vim-theme)
    (powerline-center-evil-theme)

;; Rainbow parenthesis - rainbow-delimiters
    (require 'rainbow-delimiters)
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Smooth scrolling
    (require 'smooth-scrolling)
    (setq scroll-margin 5
        scroll-conservatively 9999
        scroll-step 1)

;; Neotree - neotree
    ; when used with evil mode, first go to insert mode 'i',
    ; otherwise Enter wont open directory!
    (add-to-list 'load-path "~/Notes/org/")
    (require 'neotree)
    ; (global-set-key [f8] 'neotree-toggle)
    (evil-leader/set-key
        "ee" 'neotree-toggle)
        ; https://www.youtube.com/watch?v=NKtocCAWxiE
    ; C-c C-c - Change root directory
    ; g - refresh list
    ; A - maximize/minimize NeoTree window
    ; H - show/hide hidden files
    ; C-c C-n - Create file or directory
    ; C-c C-d - Delete file or directory
    ; C-c C-r - Rename file or directory

;; dirtree
    (require 'dirtree)
    ; (global-set-key [f2] 'dirtree)

;; evil-leader
    (require 'evil-leader)
    (global-evil-leader-mode)
    (evil-leader/set-leader "SPC")
  ; (setq evil-leader/in-all-states 1)

;; ace-window
    ; (global-set-key (kbd "C-q") 'ace-window)

;; window-numbering
    ; (window-numbering-mode 1)
    (defun init-window-numbering ()
      (evil-leader/set-key
        "0" 'select-window-0
        "1" 'select-window-1
        "2" 'select-window-2
        "3" 'select-window-3
        "4" 'select-window-4
        "5" 'select-window-5
        "6" 'select-window-6
        "7" 'select-window-7
        "8" 'select-window-8
        "9" 'select-window-9)
      (window-numbering-mode 1))
        ; http://emacs.stackexchange.com/a/3469/12727
        ; https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-evil.el

    ;; Call function
    (init-window-numbering)

;; flycheck

    (global-flycheck-mode)

    ; Check if linter/checker is active for current file
        ; :flyback-verify-setup

    ; Specify checker
        ; :flyback-select-checker

    (defun lean-toggle-flycheck-mode ()
      "Toggle flycheck-mode"
      (interactive)
      (cond
       (flycheck-mode (flycheck-mode -1))
       (t             (flycheck-mode  1))))
            ; https://github.com/leanprover/lean/blob/master/src/emacs/lean-flycheck.el

    (evil-leader/set-key
       "zs"  'lean-toggle-flycheck-mode ;;
       )

    ; https://github.com/flycheck/flycheck/issues/740
    ; (add-to-list 'flycheck-checkers 'iverilog)

    ; https://github.com/flycheck/flycheck/blob/2b13616f17e097cf804d406696609c9a7cc1edc7/flycheck.el

    ;; verilator_linter
    (setenv "PATH" (concat (getenv "PATH") ":~/local_bin"))
    (setq exec-path (append exec-path '("~/local_bin")))
        ; https://www.emacswiki.org/emacs/ExecPath


    (flycheck-define-checker verilator_linter
      "A Verilog syntax checker using the Verilator Verilog HDL simulator.
    See URL `http://www.veripool.org/wiki/verilator'."
      :command ("verilator_linter" "--lint-only" "-Wall"
                ; (option-list "-I" flycheck-verilator-include-path concat)
                source)
      :error-patterns

       ; %Warning-WIDTH: /home/user/Temp/verilog/cntr.v:46: Operator ASSIGNDLY expects 16 bits on the Assign RHS, but Assign RHS's VARREF 'proba' generates 17 bits.
      ((warning line-start "%Warning-" (zero-or-more not-newline) ": "
                (file-name) ":" line ": " (message) line-end)
       ; %Error: /home/user/Temp/verilog/cntr.v:41: syntax error, unexpected if
       (error line-start "%Error: " (file-name) ":"
              line ": " (message) line-end))
      :modes verilog-mode)

     (flycheck-add-mode 'verilator_linter 'verilog-mode)

    ;; iverilog_linter
    (flycheck-define-checker iverilog_linter
      "Icarus Verilog"
      :command ("iverilog_linter" "-Wall"
                ; (option-list "-I" flycheck-verilator-include-path concat)
                source)

        ; /home/user/Temp/verilog/cntr.v:39: syntax error
        ; /home/user/Temp/verilog/cntr.v:39: Syntax in assignment statement l-value.
        ; /home/user/Temp/verilog/cntr.v:40: syntax error
        ; /home/user/Temp/verilog/cntr.v:42: error: invalid module item.
      :error-patterns
      ((error line-start (file-name) ":" line ":" (message) "error" (optional ":" (message)) line-end))
      :modes verilog-mode)
       ; (error line-start (zero-or-more not-newline) (file-name)(zero-or-more not-newline) ":" (zero-or-more not-newline) line (zero-or-more not-newline) ":" (zero-or-more not-newline) (message) "syntax error" (zero-or-more not-newline) line-end))
       ; (error line-start (zero-or-more not-newline) ":" line ":" (message) line-end))

      ; ((warning line-start (file-name) ":" line ":
                ; "warning" line-end)

     ; (setq flycheck-iverilog-executable "iverilog -v")
     (flycheck-add-mode 'iverilog_linter 'verilog-mode)

      ; Configure checkers order, last one is default
     (add-to-list 'flycheck-checkers 'iverilog_linter)
     (add-to-list 'flycheck-checkers 'verilator_linter)
        ; http://emacs.stackexchange.com/a/12118/12727

      ; Disable checkers you do not want to use
        ; (setq-default flycheck-disabled-checkers '(iverilog_linter))
        ; (eval-after-load 'flycheck
          ; '(flycheck-add-mode 'html-tidy 'web-mode))
        ; (flycheck-checkers . 'verilator_linter)))
        ;; (flycheck-disabled-checkers 'iverilog_linter)
        ;; (setq-default flycheck-veril "c++11")

     ; (setq flycheck-iverilog-executable "iverilog -v")

;; helm
    ;; (require 'helm)
    (require 'helm-config)
    (helm-mode 1)

    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ;; rebind tab to run persistent actio

    ; C-l - Go up one level

    (evil-leader/set-key
       "q"   'helm-M-x            ;; search emacs functions
       "//"  'helm-swoop          ;; search current file
       "b"   'helm-buffers-list   ;; list buffers
       "yy"  'helm-show-kill-ring ;; list buffers
       "ff"  'helm-find-files     ;; open new file
       )

;; company
    (require 'company)
    (add-hook 'after-init-hook 'global-company-mode)
    ;; (company-mode 1)

    (setq company-idle-delay 0.2)
    (setq company-selection-wrap-around t)
    ;; (define-key company-active-map [tab] 'company-complete)
    ;; (define-key company-active-map [tab] 'company-select-next)

    ; (eval-after-load 'company
    ; '(progn
        ; (define-key company-active-map (kbd "TAB") 'company-complete)
        ; (define-key company-active-map [tab] 'company-complete)))

;; evil-org
    (require 'evil-org)
    (evil-org-mode 1)

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
    ; (define-key global-map (kbd "RET") 'newline-and-indent)

;; Show matching parenthesis
    (show-paren-mode t)

;; Dont create backup files, disable autosave
    (setq make-backup-files nil)
    (setq auto-save-default nil)
        ; https://www.emacswiki.org/emacs/AutoSave

;; Remember cursor position of saved file
    ; (setq save-place-file "~/.emacs.d/saveplace")
    ; (setq-default save-place t)
    ; (require 'saveplace)

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

;; Always folow symlinks (symbolic links)
    (setq vc-follow-symlinks t)
        ; http://stackoverflow.com/a/30900018/2450748

;; Zoom only one window
    (evil-leader/set-key
       "zz"  'delete-other-windows ;; C-w o
       )

;; Delete window
    (evil-leader/set-key
       "w"  'delete-window ;; C-w 0
       )

;; Save last session
     (desktop-save-mode 1)
        ; http://stackoverflow.com/a/803828/2450748

;; Comment/uncomment line or region
    (defun so-toggle-comment-on-line ()
    "Comments or uncomments the region or the current line if there's no active region."
        (interactive)
        (let (beg end)
            (if (region-active-p)
                (setq beg (region-beginning) end (region-end))
                (setq beg (line-beginning-position) end (line-end-position)))
            (comment-or-uncomment-region beg end)))
        ; http://stackoverflow.com/a/9697222/2450748

    (evil-leader/set-key
       "SPC"  'so-toggle-comment-on-line ;;
       )
