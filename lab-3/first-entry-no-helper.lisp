 (defun oneplus (x)
   (if (numberp x) (1+ x) x))

(defun first-entry (x e)
           (cond
             ((null x) nil)
             ((atom x) (if (eq x e) -1 nil))
             (T (or (oneplus (first-entry (car x) e)) (first-entry (cdr x) e)))))
