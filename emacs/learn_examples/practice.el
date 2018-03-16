
;; ===================================================

;; An Introduction to Emacs Lisp - YouTube
    ;; https://www.youtube.com/watch?v=2z-YBsd5snY
;; An Introduction to Emacs Lisp - Webpage, PDF
    ;; https://harryrschwartz.com/2014/04/08/an-introduction-to-emacs-lisp.html
;; Learn Emacs Lisp in 15 minutes
    ;; https://emacs-doctor.com/learn-emacs-lisp-in-15-minutes.html
;; Emacs dotfiles
    ;; https://github.com/hrs/dotfiles/blob/master/emacs/.emacs.d/configuration.org
    ;; http://pages.sachachua.com/.emacs.d/Sacha.html

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
;; add element to the front of list - push, modifies variable
    (setq bla-list '(1 5 8))
    (push 0 bla-list)

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
     (setq blb '2)
     (even-or-odd blb)

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

;; anonymous functions (functions with no name)
;; lambda() - pointer to a function
;; lambda is the symbol for an anonymous function, a function without a name
;; function defined inline
    (lambda (y) (* y y))
    ((lambda (y) (* y y)) 5)
    ((lambda (number) (* 7 number)) 3)

    ;; bind lambda function to some name - similar to defun
        (fset 'square-again (lambda (y) (* y y)))
        (square-again 10)

;; call function on multiple elements
;; 'something - means dont evaluate, just pass it as argument
    (mapcar 'upcase '("foo" "bar" "zez"))

    ;; check if integer is odd - oddp function, return t or nil
    (oddp 3)
    (oddp 4)

    ; remove elements that are not odd from list, odd elements stay
    (remove-if-not 'oddp '(0 1 2 3 4 5))
    ; remove elements that are odd from list
    (remove-if 'oddp '(0 1 2 3 4 5))

;; sort function example
    (defun quick-sort (list)
        "Sort the `list' using quicksort algorithm"
        (if (null list)
            '()
            (let* ((pivot (car list))
                (rest (cdr list))
                (lesser (remove-if-not
                    (lambda (x) (<= x pivot)) rest))
                (greater (remove-if-not
                    (lambda (x) (>= x pivot)) rest)))
              ;; (list pivot) creates new list with only pivot element
            (append (quick-sort lesser) (list pivot) (quick-sort greater)))))

    ;; check quick-sort function
        (quick-sort '(1 3 2))
        (setq sample-list '(5 3 9 -1 14 2))
        (quick-sort '(5 3 9 -1 14 2))
        (quick-sort sample-list)
        (defvar blsd '(5 3 9 -1 14 2))
        (quick-sort blsd)
        (symbol-value 'sample-list)

;; keybindings - keymaps
    (global-set-key (kbd "C-l") 'sort-lines)
    1
    2
    3

;; check current emacs mode
    major-mode

;; set keybinding for some special mode - c-mode
   (add-hook 'c-mode-common-hook
             (lambda (x)
               (local-set-key (kbd "<f5>") 'recompile)))

;; built-in documentation
    (kbd "C-h k")

    ;; describe key press - C-h k
    (describe-key (kbd "C-h k"))

    ;; search function in doc - C-h a
    (apropos-command "regex")

    ;; describe function - C-h f
    (describe-function 'quick-sort)

    ;; describe variable - C-h v
    (describe-variable 'path-separator)

    ;; describe current mode - C-h m
    (describe-mode)

    ;; help for help command - C-h C-h
    (help-for-help)


    ;; built in tutorials for elisp
    (info "(eintr) Top")
    (info "(elisp) Top")

;; =====================================================
;; https://emacs-doctor.com/learn-emacs-lisp-in-15-minutes.html

    ;; insert text in buffer after cursor (point)
    (insert "Hi there") 
    (setq myname "Yuns")
    (insert "Hi " myname)

    ;; switch to another buffer
    (switch-to-buffer-other-window "*scratch*")
    ;; write something in another buffer
    (progn
        (switch-to-buffer-other-window "*scratch*")
        (insert "Hi scratch buffer"))
    ;; delete content from *scratch* buffer
    (progn
        (switch-to-buffer-other-window "*scratch*")
        (erase-buffer))
    ;; go to next window (rotates at the end)
    (other-window 1)

    ;; read something from user - minibuffer
    (read-from-minibuffer "Enter some text:")
    (setq number_a (read-from-minibuffer "Enter some number:"))
    (message (format "You entered number %s" number_a))

    ;; write and replace text in *scratch* buffer
    (progn
        ;; go to buffer scratch in other window (horizontal split)
        (switch-to-buffer-other-frame "*scratch*")
        ;; delete content of scratch buffer
        (erase-buffer)
        ;; insert some text in scratch buffer
        (insert "bla Bla truc\n blabla bre bla")
        ;; go to next window (split) - this file, practice.el
        (other-window 1))

    (progn
        ;; go to buffer scratch in other window (horizontal split)
        (switch-to-buffer-other-frame "*scratch*")
        ;; go to the beggining of scratch buffer
        (goto-char (point-min))
        ;; search and replace string "bla" with "PRO", supress search failed
        ;; search-forward returns nil when there are are no more matches in file
        (while (search-forward "bla" nil t)
          (replace-match "PRO"))
          ;; go to next window (split) - this file, practice.el
          (other-window 1))

        ;; Lowercase matched regex - "PRO[a-zA-Z]"
        (progn
            ;; go to buffer scratch in other window (horizontal split)
            (switch-to-buffer-other-frame "*scratch*")
            ;; go to the beggining of scratch buffer
            (goto-char (point-min))
            ;; search regex "PRO[a-zA-Z]" and bold that text
            ;; search-forward returns nil when there are are no more matches in file
            (while (re-search-forward "PRO[a-zA-Z]" nil t)
              ;; C-h f add-text-properties
              ;; (replace-match (downcase (match-string 0)) t))
              ;; C-h f downcase-region
              (downcase-region (match-beginning 0) (match-end 0)))
                ;; (insert "-bre")))
            ;; go to next window (split) - this file, practice.el
            (other-window 1))

;; Elisp Tutorial - Part 3 Looping and Local Variables
    ;; https://www.youtube.com/watch?v=VqCSbDqHziM
;; loop through list
    (setq abe-list '("pita" "pizza" "persun" "pire"))
    ;; print elements that start with string "pi"
    (dolist (jelo abe-list)
      (if (string= (substring jelo 0 2) "pi")
          ;; message only prints one at a time;
          ;; print prints all lines in minibuffer
          (print jelo)))

;; sum even numbers in list
    (defun sum-evens(numbers-list)
    "Sum even numbers in list"
    (let ((sum 0))
        (dolist (elm numbers-list)
            (when (= (mod elm 2) 0)
                (setq sum (+ sum elm))))
        ;; last thing function evaluates is function return value
        sum))

    (sum-evens '(2 3 6))
    (setq ki-list '(1 3 10 20 5 4))
    (sum-evens ki-list)

;; Elisp Tutorial - Part 4 Interactive Functions
    ;; https://www.youtube.com/watch?v=KwBRpS9Bs4U
;; interactive function - appears as a call in minibuffer - :nk/count-words
    (defun nk/count-words()
      "Count number of words in *scratch* buffer"
      ;; interactive - appear as global function
      (interactive)
      ;; (set-syntax-table nk-default-table)
      ;; (setq nk-default-table (make-syntax-table)))
      ;; go to *scratch* buffer in other window
      (switch-to-buffer-other-window "*scratch*")
      (let ((sum-count 0))
        ;; remember where cursor (point) was and return
        ;; there after evaluating body inside save-excursion
        (save-excursion
            ;; treat abe_123 as one word, only for this counting (excursion)
            ;; (modify-syntax-entry ?_ "w")
            ;; treat abe-123 as one word, only for this counting (excursion)
            ;; (modify-syntax-entry ?- "w")
            ;; go to the beginning of buffer
            (goto-char (point-min))
                ;; forward symbol counts abe_123 as one word, unlike forward-word
                (while (forward-symbol 1)
                    (setq sum-count (+ sum-count 1))))
        ;; return to previous window - practice.el
        (other-window 1)
        (print (format "Number of words in *scratch* buffer: %d" sum-count))
        ;; return default behaviour for word and emacs lisp highlighting
        ;; (set-syntax-table nk-default-table)
        ;; (emacs-lisp-mode)
        ;; function return value is sum-count
        sum-count))

    ;; call function to count words in *scratch* buffer
    (nk/count-words)

;; Elisp Tutorial - Part 5 Creating a minor mode
    ;; https://www.youtube.com/watch?v=QaX3AaK3_Lk

;; minor mode to capitalize true and false keywords
    ;; define words we want to capitalize in list
    (defvar nk/words-to-capitalize '("true" "false")
        "Words to capitalize")

    (defun nk/check-and-capitalize()
      "Capitalize true and false statements"
      ;; if character entered is "e" (last character of true and false)
      ;; last-command-event is last character entered
      ;; 101 is decimal ASCII code for character "e"
      (if (= last-command-event 101)
          (nk/capitalize-true-false)))

    (defun nk/capitalize-true-false()
    ;; go back after capitalizing needed words
    (save-excursion
      ;; copy word backward from "e" to start of word
      (copy-region-as-kill (point) (progn (backward-sexp) (point)))
      ;; if copied word is in list of keywords (true, false) then capitalize it
      (when (member (current-kill 0) nk/words-to-capitalize)
        (capitalize-word 1))
      ;; remove element from keyring in order to keep keyring clean
      (setq kill-ring (cdr kill-ring))))

    ;; define new minor mode
    (define-minor-mode nk-mode/true-false-capitalize
        "Automatically capitalize true and false"
        ;; lighter is text shown above minibuffer (down)
        ;; add space in front so you dont have connected strings
        ;; when multiple lighters are used
        :lighter "NK Bool"
        ;; define add and remove hooks

        (if nk-mode/true-false-capitalize
            (add-hook 'post-self-insert-hook
                      'nk/check-and-capitalize nil t)
          (remove-hook 'post-self-insert-hook
                       'nk/check-and-capitalize t)))

    ;; start new custom minor mode
    ;;   :nk-mode/true-false-capitalize
    True
    False


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
