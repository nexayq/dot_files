
;; ===================================================

;; An Introduction to Emacs Lisp - YouTube
    ;; https://www.youtube.com/watch?v=2z-YBsd5snY
;; An Introduction to Emacs Lisp - Webpage, PDF
    ;; https://harryrschwartz.com/2014/04/08/an-introduction-to-emacs-lisp.html
;; Emacs dotfiles
    ;; https://github.com/hrs/dotfiles/blob/master/emacs/.emacs.d/configuration.org

;; USE HELP - it is great!
;; C-h f -> Functions help
;; C-h k -> Key mappings help
;; C-h v -> Variable help

;; :eval-last-sexp -> Go to the closing parentheses of expression and run this
;; :eval-region -> Evaluates selected visual region

;; use "<leader>qq" to evaluate expressions

;; ===================================================

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

;; get element from list - index start from 0
   (nth 1 '(abe bre kude))

;; variables
;; global variables
    (set 'nk_list '(1 2 3))
    (setq nk_prb '(4 5 6))

    nk_list
    nk_prb

    ;; global variable - list of strings
    (setq nk_words '(abe debe sabe))
    nk_words

    ;; local variables - let - only usable in let expression
    (let ((a 1)
        (b "prb"))
        (format "a = %d, b = %s" a b))
    ;; variable a is unavailable outside of let
    a
    ;; second variable depends on first
    (let* ((a 1)
        (b (+ a 5)))
        (format "a = %d, b = %d" a b))

;; functions
    (defun say-hello()
    (message "hello!"))
    ;; call function
    (say-hello)

    (defun square(x)
    (* x x))

    (square 5)

    (defun distance-try()
    (sqrt (+ (square (- (car '(4 2)) (car '(3 5))))
            (square (- (nth 1 '(4 2)) (nth 1 '(3 5)))))))

    ;; (+ (square (- (car '(4 2)) (car '(5 3))))
    ;; (square (- (cdr '(4 2)) (cdr '(5 3))))

    (nth 1 '(4 2))

    (distance-try)

    (defun distance(p1 p2)
    (sqrt (+ (square (- (nth 0 p2) (nth 0 p1)))
            (square (- (nth 1 p2) (nth 1 p1))))))


    (distance '(3 5) '(4 2))

;; conditionals

    ;; when is like if (no else)
    (when (eq (+ 2 2) 4)
        (message "2 + 2 = 4"))

    ;; if example
    (defun even-or-odd(n)
        (if (= (% n 2) 0)
            "even!"
        "odd!"))

     (even-or-odd 3)
     (even-or-odd 4)

     ;; cond is like switch/case in other languages
     (setq n 2)
     (cond
      ((= n 1) (format "blabla"))
      ((= n 2) (format "trlala"))
      ((= n 3) (format "pick3"))
      (t       (format "default")))

    (defun pick-a-word(n)
     (cond
      ((= n 1) (format "blabla"))
      ((= n 2) (format "trlala"))
      ((= n 3) (format "pick3"))
      (t       (format "default"))))

    (pick-a-word 1)
    (pick-a-word 3)
    (pick-a-word 5)

;; recursion in lisp
   (defun factorial(n)
     (if (< n 1)
         1
       (* n (factorial(- n 1)))))

    (factorial 5)
    (factorial 8)
    (factorial 50)
    (factorial 100)


      

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




    (string-equal (string (char-after (point))) ")")


((string (char-after 1)))
