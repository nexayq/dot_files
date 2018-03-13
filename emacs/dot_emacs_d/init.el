;; Great init.el files
    ; https://dl.dropboxusercontent.com/u/3968124/sacha-emacs.html
    ; https://github.com/gopar/.emacs.d/blob/master/init.el
    ; https://github.com/aaronbieber/dotfiles/tree/master/configs/emacs.d
    ; https://github.com/hrs/dotfiles/blob/master/emacs.d/configuration.org
    ; https://github.com/redguardtoo/emacs.d/blob/master/lisp/init-evil.el

;; Issues
    ; vertical split under Xfce
        ; Solution: run "emacs" instead of "emacs-snapshot"
            ; sudo vim /usr/share/applications/emacs-snapshot.desktop
            ; Replace "emacs-snapshot" with "emacs"
        ; emacs-snapshot is development version of emacs so it probably has some bugs
            ; http://askubuntu.com/a/12216/242730

;; package.el for emacs 23
    ; http://git.savannah.gnu.org/gitweb/?p=emacs.git;a=blob_plain;hb=ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09;f=lisp/emacs-lisp/package.el

    ; (when
        ; (load
         ; (expand-file-name "~/.emacs.d/package.el")))
    ; https://www.emacswiki.org/emacs/ELPA_

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

  ;; show help for current mode
      ;; C-h m
  ;; show all keybindings for current mode
      ;; C-h b
            ; http://stackoverflow.com/a/7135416/2450748
  ;; get help for key
      ;; C-h k
  ;; get help for function
      ;; C-h f
  ;; get help for variable
      ;; C-h v

    ;; C-y   - Paste
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

;; <<<<<<<<<<<<<<<<<<< Lisp <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    ; quote ' - used mostly for functions, means value of function
    ;           do not use ' for variable, unless for setting it (setq)
    ; Examples:
        ; (concat "Creating new session: " session-name_variable)

    ; Set variable
        ; (setq evil-vsplit-window-right 1)

    ; Check variable value
        ; evil-vsplit-window-right

;; >>>>>>>>>>>>>>>>>>> Lisp >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

;; <<<<<<<<<<<<<<<<<<< Install packages <<<<<<<<<<<<<<<<<<<<<<<

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
      powerline powerline-evil rainbow-delimiters smooth-scrolling
      neotree dirtree evil-leader ace-window window-numbering
      flycheck helm helm-swoop company evil-org popwin
      zoom-window sr-speedbar desktop+ workgroups2 drag-stuff
      evil-numbers projectile ))

; local packages
; (add-to-list 'load-path "~/.emacs.d/local_packages/org-publish/")

; multiple-cursors
; magit - requires git >= 1.9.5 :(, vc as an alternative

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


;; >>>>>>>>>>>>>>>>>>>> Install packages >>>>>>>>>>>>>>>>>>>>>>>>>>>>

;; org-mode
    (require 'org)

    ;; org-mode keyboard shortcuts
    ; (add-hook 'org-mode-hook
            ; (lambda ()
              ; (define-key evil-normal-state-local-map (kbd ">") 'evil-shift-right)
              ; (define-key evil-normal-state-local-map (kbd "<") 'evil-shift-left)
              ; ))

    (setq org-todo-keywords
           '((sequence "TODO" "PP" "|" "DONE" )))
    ; http://orgmode.org/guide/Multi_002dstate-workflows.html

    ; color source code
    (setq org-src-fontify-natively t)
    ; (setq org-src-tab-acts-natively t)
    ; (org-indent-mode t)
    ; (setq org-support-shift-select 'always)

    ; (set-default 'truncate-lines nil)
    (setq toggle-truncate-lines t)

    ; default settings for org files
        ; http://orgmode.org/mnual/In_002dbuffer-settings.html
    ; expand all sub topics at startup
    (setq org-startup-folded "showeverything")

    ; hide leading stars
    (setq org-hide-leading-stars 1)

    ; #+STARTUP: indent
    ; indent topics of next level by 2
    (setq org-startup-indented 1)

    ; #+OPTIONS H:1
    ; headings subsections numbering 4.1.1 or just 1
    (setq org-export-headline-levels 1)

    ; #+OPTIONS: num:nil
    ; no numbers for topics
    (setq org-export-with-section-numbers nil)

    ; html themes
    ; in order to use local html themes you need to copy "styles" directory where your html is generated

    ; for example
        ; > cd dir_with_org_file
        ; > ln -s ~/.emacs.d/org-mode/org-html-themes/styles/ styles
    ; Put this in org file:
        ; #+SETUPFILE: ~/.emacs.d/org-mode/org-html-themes/setup/theme-readtheorg-local.setup

    (setq org-publish-project-alist
          '(("html"
             :base-directory "~/org-export/"
             :base-extension "org"
             :publishing-directory "~/org-export/publish"
             :publishing-function org-html-publish-to-html)
            ("pdf"
             :base-directory "~/org-export/"
             :base-extension "org"
             :publishing-directory "~/org-export/publish"
             :publishing-function org-publish-org-to-pdf)
            ("all" :components ("html" "pdf"))))

    ;; Link to file [[~/.tmp.txt]]
        ; [[~/tmp.txt]]

    ;; Shift-<up/down> - Set priority to [#A], [#B], [#C] or no priority

    ;; C-c C-c - Update [X], [/], [%] percentage TODO and checkboxes

    ;; C-c C-e - Export to some format (html, latex, pdf, ...)

    ; Examples how to write org files:
        ; https://github.com/fniessen/refcard-org-mode

    ; Set org-mode options
    ; http://orgmode.org/manual/Export-settings.html

        ; SETUPFILE for HTML exporting
            ; #+SETUPFILE: ~/.emacs.d/org-mode/org-html-themes/setup/theme-readtheorg.setup

        ; Don't use header numbering 1.1.3. (just use 1.)
            ; #+OPTIONS: H:1
                ; http://tex.stackexchange.com/a/52617

        ; Expand all at startup
            ; #+STARTUP: showeverything
                ; http://orgmode.org/manual/Initial-visibility.html

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
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#424242"))
 '(custom-safe-themes
   (quote
    ("4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(fci-rule-color "#424242")
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (yasnippet yasnippet-snippets imenu-list ecb sublime-themes railscasts-theme ## solarized-theme solidity-mode color-theme ein better-defaults elpy helm-ls-git helm-cmd-t drag-stuff desktop+ color-theme-modern popwin dirtree neotree ox-twbs smooth-scrolling rainbow-delimiters powerline evil color-theme-sanityinc-tomorrow)))
 '(show-paren-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))

;; set font DejaVu Sans

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal))))
 '(col-highlight ((t (:background "color-233"))))
 '(neo-dir-link-face ((t (:foreground "cyan"))))
 '(neo-file-link-face ((t (:foreground "white")))))


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
    (require 'evil)
    ;; Use ":" instead of "M-x"
        ;; https://www.reddit.com/r/emacs/comments/41760i/meta_doesnt_work_in_evil_mode_mac_emacs/cz08x9q?st=iqwpzs42&sh=3875bd5e

    ; Fix for org mode in terminal
    (setq evil-want-C-i-jump nil)
        ; http://stackoverflow.com/a/22922161/2450748


    ; remap ; to :
    (define-key evil-normal-state-map (kbd ";") 'evil-ex)
        ; https://www.emacswiki.org/emacs/Evil

    ; write buffer with ":W"
    (evil-ex-define-cmd "W" 'save-buffer)
    (evil-ex-define-cmd "Q" 'save-buffers-kill-terminal)
    (evil-ex-define-cmd "Qa" 'save-buffers-kill-terminal)

    (evil-mode 1)

;; Color theme
    ; Many color themes
        ; https://github.com/emacs-jp/replace-colorthemes
    ; (require 'tangotango)
    ; (load-theme 'tangotango t)
    ;; Different color themes for GUI and terminal
    (if (not (display-graphic-p))
        (progn
            ; (require 'color-theme-sanityinc-tomorrow)
            ; (load-theme 'sanityinc-tomorrow-bright))
            (set-background-color "#000000")
            (set-foreground-color "#FFFFFF")))
        ; (load-theme 'wombat)
        ; (add-to-list 'default-frame-alist '(background-color . "000000")))
    ; when terminal emacs is running set background color to 0 (black)
    (unless (or (display-graphic-p) (daemonp))
        (add-to-list 'default-frame-alist '(background-color . "000000")))

    (add-to-list 'default-frame-alist '(foreground-color . "#FFFFFF"))

    ; if server daemon is running
    ; (if (daemonp)
        ; (add-hook 'after-make-frame-functions
            ; (lambda (frame)
                ; (select-frame frame)
                ; (load-theme 'sanityinc-tomorrow-bright t)))
        ; (load-theme 'sanityinc-tomorrow-bright t))

    ; (load-theme 'wombat)
    ; (load-theme 'desert)
    (load-theme 'clarity)
    ; (set-background-color "#000000")
    ; (set-face-background 'fringe "#000000")
    ; (set-face-attribute 'linum nil :background "black")
    ; (set-face-background 'linum "#000000")

    ; Set terminal background color to black
    ; (add-to-list 'default-frame-alist '(background-color . "000000"))
        ; http://stackoverflow.com/a/11419691/2450748
    ; (set-background-color "#000000")
    ; (load-theme 'wombat)
    ; (load-theme 'railscast t t)
    ; (enable-theme 'railscast)
    ; (load-theme 'clarity t t)
    ; (enable-theme 'clarity)
    ; (load-theme 'sanityinc-tomorrow-bright)
    ; (enable-theme 'sanityinc-tomorrow-bright)
    ; (add-hook 'org-mode-hook 'color-theme-sanityinc-tomorrow)

;; Powerline - powerline_evil
    (require 'powerline)
    ; ; (powerline-default-theme)
    ; (powerline-vim-theme)
    ; (powerline-center-evil-theme)
    ; (set-face-attribute 'mode-line nil
                        ; :foreground "Black"
                        ; :background "DarkOrange"
                        ; :height 200)
    (require 'powerline-evil)
    ; (powerline-evil-center-color-theme)
    ; (powerline-evil-vim-theme)
    (powerline-evil-vim-color-theme)

;; Spaceline
    ; (require 'spaceline-config)
    ; (spaceline-spacemacs-theme)

; ;; Rainbow parenthesis - rainbow-delimiters
    ; (require 'rainbow-delimiters)
    ; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

; ;; Smooth scrolling
    (require 'smooth-scrolling)
    (setq scroll-margin 5
        scroll-conservatively 9999
        scroll-step 1)

;; Neotree - neotree
    ; when used with evil mode, first go to insert mode 'i',
    ; otherwise 'Enter' wont open directory!
    (require 'neotree)
    ; (global-set-key [f8] 'neotree-toggle)
    (evil-leader/set-key
        "ee" 'neotree-toggle
        "eb" 'neotree-find)
        ; https://www.youtube.com/watch?v=NKtocCAWxiE
    ; C-c C-c - Change root directory
    ; g - refresh list
    ; A - maximize/minimize NeoTree window
    ; H - show/hide hidden files
    ; C-c C-n - Create file or directory
    ; C-c C-d - Delete file or directory
    ; C-c C-r - Rename file or directory
    (add-hook 'neotree-mode-hook
            (lambda ()
              ; (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              ; (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "t") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "'") 'neotree-enter)
              ; (define-key evil-normal-state-local-map (kbd "RET") 'neotree-change-root)
              (define-key evil-normal-state-local-map (kbd "RET") 'nk-neotree-enter)
              (define-key evil-normal-state-local-map (kbd ".") 'neotree-hidden-file-toggle)
              (define-key evil-normal-state-local-map (kbd "C-l") 'neotree-refresh)
              ))
        ; ; https://www.emacswiki.org/emacs/NeoTree

    (defun nk-neotree-enter ()
      (interactive)
      (neotree-enter)
      (neotree-change-root)
      )
        ; http://stackoverflow.com/a/27264339/2450748
        ; https://www.gnu.org/software/emacs/manual/html_node/elisp/Using-Interactive.html
    ; interactive explained
        ; Without (interactive), it can only be called programmatically,
        ; not from M-x (or via key-binding).
            ; http://stackoverflow.com/a/379171/2450748
            ; http://stackoverflow.com/a/760718/2450748



        ; https://github.com/jaypei/emacs-neotree/issues/56

    ; filter generated files when in org mode
    ; (defun nk-org-mode-setup
        ; (setq neo-hidden-regexp-list
            ; '("^\\." "\\.html" "\\.pdf" "\\.tex"))
    ; )

    ; (add-hook 'org-mode-hook 'nk-org-mode-setup)

;; dirtree
    (require 'dirtree)
    ; (global-set-key [f2] 'dirtree)

;; evil-leader
    (require 'evil-leader)
    (global-evil-leader-mode)
    (evil-leader/set-leader "SPC")
  ; (setq evil-leader/in-all-states 1)

;; ace-window
    ; (global-set-key (kbd "M-p") 'ace-window)

    ; (evil-leader/set-key
       ; ""  'ace-window ;;
       ; )

;; zoom-window
    (require 'zoom-window)

    (evil-leader/set-key
       "zz"  'zoom-window-zoom ;;
       )
    ; (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
    (setq zoom-window-mode-line-color "DarkGreen")

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

    ; Flycheck rule for GHDL:
        ; https://gist.github.com/MasWag/4b74f9ac8f1014a73246
    (flycheck-define-checker vhdl-ghdl
      "A VHDL syntax checker using ghdl."
      :command ("ghdl" "-s" "--std=93" "--ieee=synopsys" "-fexplicit" source)
      :error-patterns
      ((error line-start (file-name) ":" line ":" column
          ": " (message) line-end))
      :modes vhdl-mode)
    (flycheck-set-checker-executable 'vhdl-ghdl)

    (add-hook 'vhdl-mode-hook
              '(lambda ()
                 (setq flycheck-checker 'vhdl-ghdl)
    (flycheck-mode 1)))

    ;; python disable checker - use elpy
    ; (add-hook 'python-mode-hook
              ; '(lambda ()
                 ; (setq flycheck-checker 'python-pycompile)))


;; helm
    (require 'helm)
    (require 'helm-config)
    ; (helm-mode 1)


    ; configure where helm window is shown
    ; https://www.reddit.com/r/emacs/comments/2z7nbv/lean_helm_window/
        ; (setq helm-display-header-line nil) ;; t by default

        ; (set-face-attribute 'helm-source-header nil :height 0.1)

        ; (helm-autoresize-mode 1)
        ; (setq helm-autoresize-max-height 30)
        ; (setq helm-autoresize-min-height 30)

        ; (setq helm-split-window-in-side-p t)
        ; ; (setq helm-split-window-in-side-p nil)

    ; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ;; rebind tab to run persistent actio

    ; (defcustom helm-for-files-preferred-list
      ; '(helm-source-buffers-list
        ; helm-source-recentf
        ; helm-source-bookmarks
        ; helm-source-file-cache
        ; helm-source-files-in-current-dir
        ; ; helm-source-locate
        ; )
      ; "Your preferred sources to find files."
      ; :type '(repeat (choice symbol))
    ; :group 'helm-files)

    ; C-l - Go up one level

    ; helm-for-files to search current directory only
    ; (setq helm-ff-skip-boring-files nil)
    ; (setq helm-for-files-preferred-list
        ; '(
            ; helm-source-files-in-current-dir
            ; helm-source-recentf
            ; helm-source-buffers-list
        ; )
    ; )
        ; ; https://github.com/emacs-helm/helm/issues/216

    ; (evil-leader/set-key
       ; "q"   'helm-M-x            ;; search emacs functions
       ; "//"  'helm-swoop          ;; search current file
       ; "b"   'helm-buffers-list   ;; list buffers
       ; "yy"  'helm-show-kill-ring ;; list last deletitions
       ; ; "ff"  'helm-cmd-t          ;; open new file
       ; "fg"  'helm-ls-git-ls      ;; open new file for git project
       ; ; "ff"  'helm-find-files     ;; open new file
       ; "ff"  'helm-for-files     ;; open new file
       ; )

;; ido
    (require 'ido)
    (ido-mode t)
    (ido-everywhere t)

    ;; Ignore ** buffers
    (defvar ido-dont-ignore-buffer-names '("*scratch*" "*eshell*" "*shell*"))
    (defun ido-ignore-most-star-buffers (name)
    "This function make ido ignore NAME buffers with star except those of previous variable."
    (and
    (string-match-p "^*" name)
    (not (member name ido-dont-ignore-buffer-names))))
    (setq ido-ignore-buffers (list "\\` " #'ido-ignore-most-star-buffers))
        ; https://github.com/emacs-helm/helm/issues/1191

    (evil-leader/set-key
       ; "q"   'helm-M-x            ;; search emacs functions
       ; "//"  'helm-swoop          ;; search current file
       "r"   'ido-switch-buffer   ;; list buffers
       ; "yy"  'helm-show-kill-ring ;; list last deletitions
       ; ; "ff"  'helm-cmd-t          ;; open new file
       ; "ff"  'projectile-find-file      ;; open new file for git project
       "ft"  'projectile-find-file      ;; open new file for git project or ".projectile"
       "ff"  'ido-find-file      ;; open new file, find using tree
       ; "ff"  'helm-find-files     ;; open new file
       ; "ff"  'helm-for-files     ;; open new file
       )

    ;; Search files recursive
        ;; <leader>ft, M-f (ido-find-file)
        ;; -> find ".org" files recursive, type:
            ; "**.org"

        ; https://www.reddit.com/r/emacs/comments/23b2ai/how_do_i_make_ido_or_something_else_recursively/cgy32r7

;; projectile
    (require 'projectile)
    ; (setq projectile-indexing-method 'alien)
    (setq projectile-enable-caching t)
    (projectile-global-mode)

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

;; popwin
    (require 'popwin)
    (popwin-mode 1)

    ; Work nice with helm
        ; https://gist.github.com/syl20bnr/5516054
        (setq display-buffer-function 'popwin:display-buffer)
        (push '("^\*ido .+\*$" :regexp t) popwin:special-display-config)
        (push '("^\*ido-.+\*$" :regexp t) popwin:special-display-config)
        ; (setq helm-split-window-preferred-function 'ignore)

;; sr-speedbar
    ; (require 'sr-speedbar)
    ; ; when used with evil mode, first go to insert mode 'i',
    ; ; otherwise 'Enter' wont open directory!
    ; (evil-leader/set-key
       ; "tt"  'sr-speedbar-toggle          ;; show file hierarchy
       ; )

;; desktop+
    ; (setq server-use-tcp t)
        ; http://www.tychoish.com/posts/running-multiple-emacs-daemons-on-a-single-system/

    ; When you kill emacs, check that all are servers are killed
        ; > ps -ef | grep emacs
        ; > kill -9 6078 # example
    ; If some session has ".emacs.desktop.lock" that means emacs is still running that session
        ; ~/.emacs-local/sessions/TRY/.emacs.desktop.lock (6078)

    ; (evil-leader/set-key
       ; "nn"  'desktop+-load          ;; load session
       ; "nc"  'desktop+-create        ;; create new session
       ; "ns"  'desktop+-save          ;; create new session
       ; )

    ; (require 'desktop+)

;; workgroups2
    ; Setting up Emacs server
        ; http://stackoverflow.com/a/38655619/2450748 - My sessions
        ; https://www.gnu.org/software/emacs/manual/html_node/emacs/Emacs-Server.html
        ; https://www.gnu.org/software/emacs/manual/html_node/emacs/emacsclient-Options.html#emacsclient-Options

    ; (setq server-name "foo")

    ;; run server from command line after server name is specified (also from command line)

    ; filter generated files when in org mode
    (defun nk-org-mode-setup ()
        (setq neo-hidden-regexp-list
            '("^\\." "\\.html" "\\.pdf" "\\.tex" "styles"))
    )

    (setq server-socket-dir "~/.emacs-local/server")

    (defun nk-server-start (custom-server)
        ; (nk-server-start "abe")
        (setq server-name custom-server)

        (if (string= server-name "todo")
            (nk-org-mode-setup)
        )

        (server-start) ; run emacs server
        (setq wg-session-file (concat "~/.emacs-local/sessions/" custom-server))
        ; (setq wg-session-file "~/.emacs-local/sessions/proba")
        (workgroups-mode 1)
        (wg-switch-to-workgroup custom-server)

    )
    ; Run file in specific server (foo)
        ; emacsclient -n callback.sh -s ~/.emacs-local/server/foo

    ; Show server name in title bar
    (setq frame-title-format '("" "%b @ " server-name))
        ; https://www.emacswiki.org/emacs/FrameTitle

    (require 'workgroups2)
    ; (setq wg-prefix-key '(nil))

    (evil-leader/set-key
       "nc"  'wg-create-workgroup
       ; "nn"  'wg-reload-session      ;;
       ; "nn"  'wg-save-session      ;;
       "nn"  'wg-save-session      ;;
       "nr"  'wg-rename-workgroup
       "no"  'wg-switch-to-workgroup
       ; "nk"  'wg-kill-workgroup
       ; "no"  'wg-open-session
       "na"  'wg-switch-to-workgroup-at-index-0
       "ns"  'wg-switch-to-workgroup-at-index-1
       "nd"  'wg-switch-to-workgroup-at-index-2
       "nf"  'wg-switch-to-workgroup-at-index-3
       ; "nn"  'wg-reload-session      ;;
     )

    ; ;; What to do on Emacs exit / workgroups-mode exit?
    (setq wg-emacs-exit-save-behavior           'save)      ; Options: 'save 'ask nil
    (setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil

    ; ; (wg-find-session-file "~/.emacs-local/workspace_old")
    ; (wg-open-session "~/.emacs-local/workgroups")
    ; (run-with-timer 1 (* 1 60) 'wg-save-session)
    ; (add-hook 'kill-emacs-hook (lambda () (wg-save-session)))



    ; (add-hook 'kill-emacs-hook (lambda () (wg-save-session)))
    ; (run-with-timer 0 (* 1 60) 'wg-save-session)

;; Save last session
    ; (setq nk-session-dir "~/.emacs-local/sessions/")
    ; (setq-default desktop+-base-dir nk-session-dir)
     ; ; (setq desktop-base-file-name "proba_cstm")
     ; (setq desktop-path (list nk-session-dir))
     ; (setq desktop-dirname nk-session-dir)
     ; ; ; (setq desktop-save-mode 1)
     ; ; (setq desktop-save t)
     ; ; (desktop-save-mode 1)
     ; ; ; (desktop-read)
     ; ; ; (add-hook 'emacs-startup-hook 'desktop-read)
        ; ; https://www.emacswiki.org/emacs?action=browse;oldid=DeskTop;id=Desktop
        ; ; http://stackoverflow.com/a/4485083/2450748

    ; ; (setq nk-session-dir "~/.emacs_local/sessions/")
    ; ; (setq nk-session-name "PRB3")
    ; ; (setq-default desktop+-base-dir nk_session-dir)

    ; ;; unused - workgroups2 used instead
    ; (defun nk-create-load-session (session-name session-dir)
        ; "Load session or create session SESSION-NAME in SESSION-DIR if it doesn't exist."
            ; " (nk-create-load-session nk-session-dir nk-session-name) "
                ; " Session directory"
                ; (setq session-path (concat session-dir session-name))
                ; (if (file-exists-p session-path);if
                    ; (progn
                        ; (message (concat "Session already exists, loading session: " session-path) ) ; then
                        ; (desktop+-load session-name))
                  ; (message (concat "Creating new session: " session-name)) ; else
                  ; (make-directory session-path 'parents)
                  ; (desktop+-create session-name)))

    ; ;; unused - workgroups2 used instead
    ; (defun nk-load-session (session-name)
        ; (nk-create-load-session session-name nk-session-dir))

    ; (add-hook 'kill-emacs-hook (lambda () (desktop+-save)))

    ; (defvar desktop+-base-dir "~/.emacs_sessions/"
    ; "Base directory for desktop files.")

    ; Must use M-x, with : it wont call desktop+ functions!
    ; Create new session (desktop+)
        ; M-x desktop+-create

;; drag-stuff
    (require 'drag-stuff)
    (drag-stuff-global-mode 1)

    ; (global-set-key [M-k] 'drag-stuff-up)
    ; (global-set-key [M-j] 'drag-stuff-down)

    (define-key evil-normal-state-map (kbd "K") nil)
    (define-key evil-normal-state-map (kbd "J") nil)
    (define-key evil-visual-state-map (kbd "K") nil)
    (define-key evil-visual-state-map (kbd "J") nil)
    (define-key evil-normal-state-map (kbd "K") 'drag-stuff-up)
    (define-key evil-normal-state-map (kbd "J") 'drag-stuff-down)
    (define-key evil-visual-state-map (kbd "K") 'drag-stuff-up)
    (define-key evil-visual-state-map (kbd "J") 'drag-stuff-down)

    (define-key org-mode-map (kbd "K") nil)
    (define-key org-mode-map (kbd "J") nil)


;; evil-numbers
    (require 'evil-numbers)
    (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; {{{{{{{{{{{{{{{{{{ Packages {{{{{{{{{{{{{{{{{

    ;; remap / to /\c - no need, emacs search case insensitive great
    ;; (define-key evil-operator-state-map "w" "iw")

;; Show line numbers
    (global-linum-mode t)
    ; (linum-relative-global-mode)
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
    (setq create-lockfiles nil)
        ; https://www.emacswiki.org/emacs/AutoSave
    (setq backup-directory-alist '(("." . "~/emacs-backups")))
        ; http://stackoverflow.com/a/1199346/2450748

;; Remember cursor position of saved file
    ; (setq save-place-file "~/.emacs.d/saveplace")
    ; (setq-default save-place t)
    ; (require 'saveplace)

;; Toggle whitespace
    ; (defun tf-toggle-show-trailing-whitespace ()
      ; "Toggle show-trailing-whitespace between t and nil"
      ; (interactive)
      ; (setq show-trailing-whitespace (not show-trailing-whitespace)))
            ; ; http://stackoverflow.com/a/11701899/2450748

    (setq whitespace-style (quote
       ( face trailing tabs)))

    ; Show trailing whitespaces by default
        (whitespace-mode)

    (evil-leader/set-key
       ; "zw"  'tf-toggle-show-trailing-whitespace      ;; show trailing spaces
       "zw"  'whitespace-mode      ;; toggle trailing spaces
     )

;; Retab
    ; indent-region
    ; indent-buffer

    (defun indent-buffer ()
      (interactive)
      (save-excursion
        (indent-region (point-min) (point-max) nil)))

    (evil-leader/set-key
       "zt"  'indent-buffer     ;; retab selected region
     )

;; Delete trailing whitespace
    (evil-leader/set-key
       "k"  'delete-trailing-whitespace      ;; delete trailing spaces
     )

;; Launch terminal from emacs
    ; :ansi-termi - fully supported terminal (up/down works)
    ; :shell (M-x shell) - inferior terminal (up/down does not work)
    ; :eshell - Emacs lisp shell, shell written in lisp (up/down works)
        ; https://www.masteringemacs.org/article/running-shells-in-emacs-overview

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

;; Zoom only one window - added unzoom with package 'zoom-window'
    ; (evil-leader/set-key
       ; "zz"  'delete-other-windows ;; C-w o
       ; )

;; Delete window, split window
    (evil-leader/set-key
       "w"  'delete-window      ;; C-w 0
       ; "we"  'split-window-right ;;
       ; "we"  'split-right ;;
       ; "ws"  'split-window-below ;;
       )

    ; :vsplit window to the right, :split to down
    (setq evil-vsplit-window-right 1)
    (setq evil-split-window-below 1)

    ; (evil-ex-define-cmd "sp[lit]" 'split-window-below-and-focus)
    ; (evil-ex-define-cmd "vs[plit]" 'split-window-right-and-focus)

;; Save last session
     ; (setq desktop-base-file-name "proba")
     ; (setq desktop-path '("~/.emacs.d/"))
     ; (setq desktop-dirname "~/.emacs.d/")
     ; (desktop-save-mode 1)
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

;; vc bindings
    ; https://www.emacswiki.org/emacs/VersionControl
    (evil-leader/set-key
       "gd"  'vc-diff          ;; diff current file
       "gs"  'vc-dir           ;; Show changed files
            ; "=" - show diff for current file
            ; "D" - show diff for all files
       "gu"  'vc-revert        ;; undo current file to original (vcs)
       )

;; verilog-mode
    ; Show Verilog menu - really important
        ; :menu-bar-open
            ; http://stackoverflow.com/a/191377/2450748

    ; Tutorials/Examples
        ; http://rcir.sjtu.edu.cn/en/~cgliu/resource/ppt/emacs_verilog.pdf

    ;; Example:

        ; module try_mod (/*AUTOARG*/) ;
           ; input  a;
           ; input  b;
           ; output c;
           ; /*AUTOWIRE*/
           ; /*AUTOREG*/

           ; always @ ( /*AUTOSENSE*/) begin
             ; c = a & b
           ; end
        ; endmodule // try_mod

    ;; show help for current mode
        ;; C-h m
    ;; show all keybindings for current mode
        ;; C-h b

    ; C-c C-t h - Generate header
        ; http://emacs.stackexchange.com/a/10149/12727

    (add-hook 'verilog-mode-hook
        ; verilog-sk-*
              (lambda ()
                        (evil-leader/set-key
                                "th" 'verilog-sk-header
                                "tm" 'verilog-sk-module
                                "ti" 'verilog-sk-input
                                "to" 'verilog-sk-output
                        ; C-c C-a - expand AUTOARG, AUTOWIRE, AUTOREG, AUTOSENSE, ...
                        ; C-c C-k - undo expand of AUTOARG, AUTOWIRE, AUTOREG, AUTOSENSE, ...
                                "ts" 'verilog-sk-state-machine
                                "ta" 'verilog-sk-always
               )))

;; vhdl-mode
    ; Show VHDL menu - really important
        ; :menu-bar-open
            ; http://stackoverflow.com/a/191377/2450748

      ;; show help for current mode
          ;; C-h m
      ;; show all keybindings for current mode
          ;; C-h b
    ; Tutorials
        ; https://www.microlab.ti.bfh.ch/bachelor/f/BTF4220/digital_electronics_2/public/digital/emacsTemplates.pdf

    ;; Show hierarchy
        ; VHDL -> Speedbar

    ; (global-font-lock-mode 1)
    ; (autoload 'vhdl-mode "vhdl-mode" "VHDL Editing Mode" t)
    ; (setq vhdl-electric-mode t)
    ; (setq vhdl-stutter-mode t)

    ; C-c C-t C-h  - generate header
    ; C-c C-t en - generates entity template
    ; C-c C-t ar - architecture
    ; C-c C-t si - signal
    ; C-c C-t it - if then
    ; C-c C-t el - else
    ; C-c C-t ei - elsif

    ; :vhdl-beautify-buffer - Autoindents VHDL code

    ; Show statistics for lines of code, comments, ...
        ; VHDL -> Statistics buffer
            ; Open buffer "*Messages*" to see the output

    ; http://stackoverflow.com/a/14230685/2450748
    ; (add-hook 'vhdl-mode-hook
              ; (lambda () (evil-leader/set-key "th" 'vhdl-template-header)))
                    ; http://stackoverflow.com/a/14230685/2450748

    ; (add-hook 'vhdl-mode-hook
              ; (lambda () (evil-leader/set-key "te" 'vhdl-template-entity)))

    ; http://stackoverflow.com/a/14230685/2450748
    (add-hook 'vhdl-mode-hook
        ; vhdl-template-*
              (lambda ()
                        (evil-leader/set-key
                                "th" 'vhdl-template-header
                                "tn" 'vhdl-compose-new-component
                                "tp" 'vhdl-template-port
                                "tf" 'vhdl-template-for-generate
                                "te" 'vhdl-template-entity
                                "ta" 'vhdl-template-architecture
                                "ti" 'vhdl-template-component-inst
               )))

    (evil-leader/set-key
       "gd"  'vc-diff          ;; diff current file
       "gu"  'vc-revert        ;; undo current file to original (vcs)
       )

;; sr-speedbar - like Tagbar in vim
    ; o - expand hierarchy

;; Add verilog mode to the speedbar
    (require 'speedbar)
    (speedbar-add-supported-extension '(".v" ".sv" ".svh" ))
        ; http://www.veripool.org/issues/1025-Verilog-mode-Integration-with-the-speedbar

;; disable bell and flashing
    ; (setq visible-bell 1)
    (setq ring-bell-function 'ignore)
        ; https://www.emacswiki.org/emacs/AlarmBell

;; edif vertical split for diff
    (setq ediff-split-window-function 'split-window-horizontally)
    (setq ediff-window-setup-function 'ediff-setup-windows-plain)

    (evil-leader/set-key
       "zd"  'ediff          ;; diff current file
       )
;; elpy for python
    (require 'elpy)
    (elpy-enable)

    (setq python-shell-interpreter "ipython3"
          python-shell-interpreter-args "-i")

    (add-hook 'python-mode-hook
        ; verilog-sk-*
              (lambda ()
                        (evil-leader/set-key
                                "pp" 'elpy-shell-send-region-or-buffer
               )))

; ;; emacs ipython notebook
    ; (require 'ein)

;; pdb debugger setup
    (setq gud-pdb-command-name "python -m pdb")

;; choose color theme
    ; (load-file "~/.emacs.d/themes/color-theme-desert.el")
    ; (set-face-foreground 'font-lock-string-face "red")
    ; (set-face-foreground 'font-lock-string-face "light blue")
    ; (set-face-foreground 'font-lock-comment-face "blue")
    ;; Please set your themes directory to 'custom-theme-load-path
    ; (add-to-list 'custom-theme-load-path
                 ; (file-name-as-directory "~/.emacs.d/themes/replace-colorthemes"))

    ;; load your favorite theme
    ; (require 'railscasts-theme)
            ; (load-theme 'railscasts-theme)
    ; (load-theme 'railscasts-theme)
    ; (enable-theme 'railscast-theme)

;; imenu-list - like tagbar
    (require 'imenu-list)
    (evil-leader/set-key
        "tt" 'imenu-list-smart-toggle
        "ta" 'nk-semantic-mode-toggle)
    ; (setq imenu-list-idle-update-delay-time 5)
    ; use <SPACE> to stay in tag window while jumping to functions


    ;; can slow down emacs!
    (defun nk-semantic-mode-toggle ()
      (interactive)
      (if (not semantic-mode)
          (semantic-mode 1)
       (semantic-mode 0)))

;; turn on semantic-mode by default
;; can slow down emacs! drastically - cpp files for example
    ; (add-hook 'speedbar-load-hook (lambda () (require 'semantic/sb)))
    ; (require 'cedet-global)
    ; (require 'cc-mode)
    ; (require 'semantic)
    ; ; (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
    ; ; (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
    ; (global-semanticdb-minor-mode 1)
    ; (global-semantic-idle-scheduler-mode 1)
    ; (semantic-mode 1)

;; turn on snippets
    ; (require 'yasnippet)
    ; (require 'yasnippet-snippets)
    ; (yas-global-mode 1)
    ; (use-package yasnippet
        ; :ensure t
        ; :init
            ; (yas-global-mode 1))

;; find tags and definitions
    ; (require 'ggtags)
    ; (add-hook 'c-mode-common-hook
              ; (lambda ()
                ; (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                  ; (ggtags-mode 1))))

;; print function definition

    (defun nk-print-fun-def ()
        (interactive)
        (save-excursion
            (setq nk-word (current-word))
            (beginning-of-buffer)
            (word-search-forward nk-word)
            (message "%s" (buffer-substring-no-properties
                           (line-beginning-position) (line-end-position)))))

    (defun nk-try ()
        (interactive)
        (setq nk-word (current-word))
        (beginning-of-buffer)
        (word-search-forward nk-word))

    ; (defun nk-print-fun-def ()
        ; (interactive)
        ; (isearch-forward-word (word-at-point)))
        ; (goto-char (beginning-of-buffer))
        ; (re-search-forward (thing-at-point 'word) nil t))
        ; (occur (thing-at-point 'word)))

    (define-key evil-normal-state-map (kbd "[i") 'nk-print-fun-def)
    (define-key evil-normal-state-map (kbd "[[") 'nk-try)
    ; (evil-leader/set-key
        ; "[i" 'nk-print-fun-def)

;; print file name of current buffer
    (defun show-file-name ()
      "Show the full path file name in the minibuffer."
      (interactive)
      (message (buffer-file-name)))

    (defun my-put-file-name-on-clipboard ()
      "Put the current file name on the clipboard"
      (interactive)
      (let ((filename (if (equal major-mode 'dired-mode)
                          default-directory
                        (buffer-file-name))))
        (when filename
          (with-temp-buffer
            (insert filename)
            (clipboard-kill-region (point-min) (point-max)))
          (message filename))))

    (defun nk-show-copy-file-path ()
      (interactive)
      (show-file-name)
      (my-put-file-name-on-clipboard))

    (evil-leader/set-key
        "xf" 'nk-show-copy-file-path)
        ; "eb" 'neotree-find)

;; gbd setup
    ;; compile source code with -g flag - debugging
        ;; g++ ./b.cpp -o b.out -g

    ;; from emacs run gdb
        ;; :gdb -i=mi b.out

    ;; specify file for debugging in gdb
        ;; file b.out

    ;; set breakpoints in file from gdb (line 31)
        ;; click on left side of code to select debug point
            ;; or
        ;; (gdb) break b.cpp:31
            ;; or
        ;; use <leader>dd to specify temp debug line - one session only

    ;; run your program from gdb
        ;; r

    ;; go to next instruction
        ;; n

    ;; continue program execution
        ;; c

    ;; set breakpoint at current line
    (evil-leader/set-key
        "dd" 'gud-break)

    ;; setup debug view (6 windows)
    (setq
         ;; use gdb-many-windows by default
         gdb-many-windows t

         ;; Non-nil means display source file containing the main routine at startup
         gdb-show-main t
     )

;; run emacs lisp (elisp) commands in emacs - run "ielm"
    ;; :ielm
    (defun nk-replace-string()
        (interactive)
        (minibuffer-with-setup-hook
            (lambda () (backward-char 3))
            (evil-ex "%s,,,g")))
        ; https://stackoverflow.com/a/22795728/2450748

    (defun nk-replace-string-cursor()
        (interactive)
        (minibuffer-with-setup-hook
            (lambda () (backward-char 3))
            (evil-ex (concatenate 'string "%s," (current-word) ",,gc"))))
        ; https://stackoverflow.com/a/22795728/2450748

    (evil-leader/set-key
        "ss"  'nk-replace-string
        "sww" 'nk-replace-string-cursor)

;; eval-region for elisp
    (defun nk-eval-elisp-region (beginning end)
      (interactive "r")
      (if (use-region-p)
        (eval-region beginning end)))

    ; (defun nk-eval-elisp-line
      ; (interactive)
        ; (call-interactively 'eval-last-sexp))

    (defun nk-eval-elisp-function()
      (interactive)
      (if (not (string-equal (string (char-after (point))) ")"))
        (progn
          (if (not (string-equal (string (char-after (point))) "("))
              (goto-char (search-backward "(")))
          ;; match pair closed parentheses
          (evil-jump-item)))
          ;; (left-char)
        ; (save-excursion
            ; (move-end-of-line nil)
          ; (evil-forward-WORD-end nil)
            (call-interactively 'eval-last-sexp))

    (defun nk-eval-elisp-sexp()
      (interactive)
          ; (goto-char (search-forward-regexp ")\\|\s\\|$"))
          ; (goto-char (search-forward-regexp "[0-9a-zA-Z_-]+"))
          ;; (left-char 1)
          (call-interactively 'eval-last-sexp))

    (define-key evil-normal-state-map (kbd "SPC q q") 'nk-eval-elisp-function)
    (define-key evil-visual-state-map (kbd "SPC q q") 'nk-eval-elisp-region)
    (define-key evil-normal-state-map (kbd "SPC q w") 'nk-eval-elisp-sexp)

    ; (evil-leader/set-key
        ; "qq" evil-visual-state-map 'nk-eval-elisp-region
        ; "qq" evil-normal-state-map 'nk-eval-elisp-line)

;; save location of cursor (point) of closed file
    (save-place-mode t)
