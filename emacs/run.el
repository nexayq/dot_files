(let ((buffer (url-retrieve-synchronously
               "http://tromey.com/elpa/package-install.el")))
  (save-excursion
    (set-buffer buffer)
    (goto-char (point-min))
    (re-search-forward "^$" nil 'move)
    (eval-region (point) (point-max))
    (kill-buffer (current-buffer))))

; list the packages you want
(setq package-list '(evil org-mode color-theme-sanityinc-tomorrow))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages") t)


(setq a 1)
(print a)
(setq-default nk_session-dir "~/.emacs/sessions")
(print nk_session-dir)
(print desktop+-base-dir)

(defun nk_check-session ()
  "Load session or create session if it doesn't exist."
  (if (file-exists-p "~/.emacs/sessions/rser/.emacs.desktop") ;if
      (message "Session already exists, loading session") ; then
    (message "Creating new session!")) ; else
  )

(nk_check-session)

(file-exists-p "~/callback.sh")
(file-exists-p "~/cadf.txt")
(file-exists-p "~/.emacs/sessions/PRB3/.emacs.desktop")


(defun nk-try-load-session ()
  "Load session or create session if it doesn't exist."
  (if (file-exists-p "~/.emacs/sessions/PRB3/.emacs.desktop") ;if
      (message "Session already exists, loading session") ; then
    (message "Creating new session!")) ; else
  )

(nk-try-load-session)

(setq nk-session-dir "~/.emacs_local/sessions/")
(setq nk-session-name "PRB3")
(setq-default desktop+-base-dir nk_session-dir)

(defun nk-create-load-session (session-name session-dir)
    "Load session or create session SESSION-NAME in SESSION-DIR if it doesn't exist."
        " Session directory"
        (setq session-path (concat session-dir session-name))
        (if (file-exists-p session-path);if
            (progn
                (message (concat "Session already exists, loading session: " session-path) ) ; then
                (desktop+-load session-name))
          (message (concat "Creating new session: " session-name)) ; else
          (make-directory session-path)
          (desktop+-create session-name)))

(nk-create-load-session nk-session-dir nk-session-name)

    (if (display-graphic-p)
        (progn
            (require 'color-theme-sanityinc-tomorrow)
            (load-theme 'sanityinc-tomorrow-bright))
        (load-theme 'wombat))

(message server-name)
