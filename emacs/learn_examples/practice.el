
;; https://www.youtube.com/watch?v=2z-YBsd5snY

;; USE HELP - it is great!
;; C-h f -> Functions help
;; C-h k -> Key mappings help
;; C-h v -> Variable help

;; :eval-last-sexp -> Go to the closing parentheses of expression and run this
;; :eval-region -> Evaluates selected visual region

;; use "<leader>qq" to evaluate expressions

;; constants (atoms)
2
3.5
"abe"
path-separator
 abe_proba

;; add function
(+ 1 3)

;; nesting functions
(+ (* 2 3) (/ 36 4))

;; print message in minibuffer (command window)
(message "hello there")

(message "%s" (+ 1 3))

;; lists

;; error - evaluates function 1 on arguments 2 and 3
(1 2 3)

;; say it is a list - quote
(quote (1 2 3))

;; quote - treat it as a list and not as a function

;; other way of writing quote
'(1 2 3)

;; first element of list - car (contents of the address part of the register)
(car '(1 2 3))
;; rest elements of list (all except first) - cdr (contents of decrement part of the register)
(cdr '(1 2 3))

;; empty list, same as nil
'()

;; check equality of empty list and nil
(eq '() nil)

;; check if something is nil - null function
(null nil)
(null '(1 2 3))

;; construct list - add one new element
(cons 1 '(2 3))
(cons 1 (cons 2 (cons 3 '())))

;; append - add more elements to the list
(append '(1 2) '(3 4))

(goto-char (search-forward ")"))

;;; practice starts here

    (defun nk-eval-elisp-function()
      (interactive)
          (goto-char (search-backward "("))
          (evil-jump-item)
          ;; (left-char)
        ; (save-excursion
            ; (move-end-of-line nil)
          ; (evil-forward-WORD-end nil)
            (call-interactively 'eval-last-sexp))


    (defun nk-eval-elisp-variable()
      (interactive)
          ; (goto-char (search-forward-regexp ")\\|\s\\|$"))
          (goto-char (search-forward-regexp "[0-9a-zA-Z_-]+"))
          ;; (left-char 1)
          (call-interactively 'eval-last-sexp))

    (defun nk-eval-elisp-variable()
      (interactive)
      (goto-char (search-forward-regexp ")\\|\s"))
      (left-char 2)
      (call-interactively 'eval-last-sexp))

    (search-forward-regexp "x\\| ")___x

    (defun nk-replace-string()
        (interactive)
    (minibuffer-with-setup-hook
        (lambda () (backward-char 3))
        (evil-ex "%s,,,g")))
        ; https://stackoverflow.com/a/22795728/2450748

    (defun nk-eval-elisp-function()
      (interactive)
          (goto-char (search-forward ")"))
          (left-char)
        ; (save-excursion
            ; (move-end-of-line nil)
            (call-interactively 'eval-last-sexp))


    (defun nk-eval-elisp-line()
      (interactive)
        (save-excursion
            (move-end-of-line nil)   ;; proba
            (call-interactively 'eval-last-sexp)))
